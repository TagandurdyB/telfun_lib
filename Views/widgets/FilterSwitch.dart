import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/Providers/FilterProvider.dart';
import 'package:telfun/ViewModels/JsonCacher.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/ViewModels/Providers/ValueProvider.dart';

class FilterFuncGroup {
  final List objs;
  final String apiTag, jsonTag;
  final bool isCheck;
  FilterFuncGroup({
    this.isCheck,
    this.apiTag,
    this.jsonTag,
    this.objs,
  });

  void allSwitch(BuildContext context) async {
    final provider = Provider.of<FilterProvider>(context, listen: false);
    List _list = objs;
    final String _apiTag = apiTag == ApiTags.place ? ApiTags.etraps : apiTag;
    bool _canAdded = false;
    bool _canRemowed = false;
    List _mapList = MapConverter(ApiName: _apiTag, ElemList: _list).toMap();
    if (jsonTag == JsonTags.filterEtrap && isCheck) {
      _canRemowed =
          await JsonListCacher(jsonName: jsonTag).multiRemoveSaved(_mapList);
      print("Can Multi Remowed:= $_canRemowed");
      provider.multiRemoweFilter(_list, JsonTags.filterEtrap);
    } else if (jsonTag == JsonTags.filterPlace && isCheck) {
      _canRemowed =
          await JsonListCacher(jsonName: JsonTags.filterEtrap).removeAllSaved();
      print("Can All Etraps Remowed:= $_canRemowed");
      provider.tongleAllFilter(_list, JsonTags.filterEtrap, true);
    }else if (jsonTag == JsonTags.filterPlace && !isCheck) {
      _canRemowed =
      await JsonListCacher(jsonName: JsonTags.filterEtrap).multiAddSaved(_mapList);
      print("Can All Etraps Added:= $_canRemowed");
      provider.tongleAllFilter(_list, JsonTags.filterEtrap, false);
    } else if (isCheck) {
      _canRemowed = await JsonListCacher(jsonName: jsonTag).removeAllSaved();
      print("Can All Remowed:= $_canRemowed");
      provider.tongleAllFilter(_list, jsonTag, true);
    } else {
      _canAdded =
          await JsonListCacher(jsonName: jsonTag).multiAddSaved(_mapList);
      print("Can All Added:= $_canAdded");
      provider.tongleAllFilter(_list, jsonTag, false);
    }
  }
}

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
    } else {
      FilterFuncGroup(
        apiTag: widget.apiTag,
        jsonTag: widget.jsonTag,
        isCheck: widget.isCheck,
        objs: widget.objs,
      ).allSwitch(context);
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
