import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/Providers/FilterProvider.dart';
import 'package:telfun/ViewModels/JsonCacher.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/ViewModels/Providers/ValueProvider.dart';

class FilterSwitch extends StatefulWidget {
  bool isCheck;
  final obj;
  final String title;
  final List objs;
  final String jsonTag, apiTag;
  final Function func;
  FilterSwitch(
      {this.objs,
        this.apiTag,
      this.func,
      this.isCheck = false,
      this.title,
      this.obj,
      this.jsonTag});

  @override
  State<FilterSwitch> createState() => _FilterSwitchState();
}


class _FilterSwitchState extends State<FilterSwitch> {
  Map convert(_obj) {
    Map _map = {};
    switch (widget.jsonTag) {
      case JsonTags.filterMark:
        {
          _map = localConverter().elemMarkToMap(_obj);
        }
        break;
      case JsonTags.filterModel:
        {
          _map = localConverter().elemModelToMap(_obj);
        }
        break;
      case JsonTags.filterColor:
        {
          _map = localConverter().elemColorToMap(_obj);
        }
        break;
      case JsonTags.filterPlace:
        {
          _map = localConverter().elemPlaceToMap(_obj);
        }
        break;
      case JsonTags.filterEtrap:
        {
          _map = localConverter().elemEtrapToMap(_obj);
        }
        break;
    }
    return _map;
  }

  void funcTongle() async {
    final provider = Provider.of<FilterProvider>(context, listen: false);
     if (widget.title != "Ähli") {
      final _obj = widget.obj;
      Map _map = convert(_obj);
      bool _canAdded = false;
      bool _canRemowed = false;
      if (widget.isCheck) {
        _canRemowed =
            await JsonListCacher(jsonName: widget.jsonTag).removeSaved(_map);
        print("Can Remowed:= $_canRemowed");
        provider.reload();
      } else {
        _canAdded =
            await JsonListCacher(jsonName: widget.jsonTag).addSaved(_map);
        print("Can Added:= $_canAdded");
      }
      provider.tongleFilter(_obj, widget.jsonTag);

      if(widget.jsonTag==JsonTags.filterEtrap){

      }

    }
 else {
      List _list =widget.objs;
      /*if(ApiTags.etraps!=widget.apiTag) {
        _list = Provider.of<ValuesProvider>(context, listen: false)
            .all(widget.apiTag);
      }
      else{
        _list = Provider.of<ValuesProvider>(context, listen: false)
            .placeEtrapObjs();
      }*/
      bool _canAdded = false;
      bool _canRemowed = false;
      List _mapList =
          MapConverter(ApiName: widget.apiTag, ElemList: _list).toMap();
      if (widget.isCheck) {
        _canRemowed =
            await JsonListCacher(jsonName: widget.jsonTag).removeAllSaved();
        print("Can Multi Remowed:= $_canRemowed");
      } else {
        _canAdded = await JsonListCacher(jsonName: widget.jsonTag)
            .multiAddSaved(_mapList);
        print("Can Multi Added:= $_canAdded");
      }
      provider.tongleAllFilter(_list, widget.jsonTag, widget.isCheck);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
            title: Text(widget.title, style: ThemeProvided().styleUserPage),
            value: widget.isCheck,
            onChanged: (bool _val) async {
              await funcTongle();
              if (widget.func != null) widget.func();
            }),
        Container(color: Colors.purpleAccent, height: 2),
      ],
    );
  }
}
