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
  final String jsonTag,apiTag;
  final Function func;
  FilterSwitch(
      {this.apiTag,this.func, this.isCheck = false, this.title, this.obj, this.jsonTag});

  @override
  State<FilterSwitch> createState() => _FilterSwitchState();
}

class _FilterSwitchState extends State<FilterSwitch> {

  Map convert(_obj){
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

  void funcTongle() {
    final provider = Provider.of<FilterProvider>(context, listen: false);
    if(widget.title!="Ähli"){
      final _obj = widget.obj;
      Map _map = convert(_obj);
      if (widget.isCheck) {
        JsonListCacher(jsonName: widget.jsonTag).removeSaved(_map);
      } else {
        JsonListCacher(jsonName: widget.jsonTag).addSaved(_map);
      }
      provider.tongleFilter(_obj, widget.jsonTag);
      provider.reload();
    }
    else {
List _list=Provider.of<ValuesProvider>(context,listen: false).all(widget.apiTag);
_list.forEach((element) {
  final _obj = element;
  Map _map = convert(_obj);
  if (widget.isCheck) {
    JsonListCacher(jsonName: widget.jsonTag).removeSaved(_map);
  } else {
    JsonListCacher(jsonName: widget.jsonTag).addSaved(_map);
  }
  provider.tongleFilterAll(_obj, widget.jsonTag,widget.isCheck);
});

provider.reload();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
            title: Text(widget.title, style: ThemeProvided().styleUserPage),
            value: widget.isCheck,
            onChanged: (bool _val) {
              funcTongle();
              setState(() {
                widget.isCheck = _val;
              });
              if (widget.func != null) widget.func();
            }),
        Container(color: Colors.purpleAccent, height: 2),
      ],
    );
  }
}
