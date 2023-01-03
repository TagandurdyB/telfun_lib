import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/FilterProvider.dart';
import 'package:telfun/ViewModels/JsonCacher.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';

class FilterSwitch extends StatefulWidget {
  bool isCheck;
  final obj;
  final String title;
  final String JsonTag;
  final Function func;
  FilterSwitch(
      {this.func, this.isCheck = false, this.title, this.obj, this.JsonTag});

  @override
  State<FilterSwitch> createState() => _FilterSwitchState();
}

class _FilterSwitchState extends State<FilterSwitch> {
  void funcTongle() {
    Map _map = {};
    print("Filter Json:=${widget.JsonTag}");
    switch (widget.JsonTag) {
      case JsonTags.filterMark:
        {
          _map = localConverter().elemMarkToMap(widget.obj);
        }
        break;
      case JsonTags.filterModel:
        {
          _map = localConverter().elemModelToMap(widget.obj);
        }
        break;
      case JsonTags.filterColor:
        {
          _map = localConverter().elemColorToMap(widget.obj);
        }
        break;
      case JsonTags.filterPlace:
        {
          _map = localConverter().elemPlaceToMap(widget.obj);
        }
        break;
      case JsonTags.filterEtrap:
        {
          _map = localConverter().elemEtrapToMap(widget.obj);
        }
        break;
    }
    if (widget.isCheck) {
      JsonListCacher(jsonName: widget.JsonTag).removeSaved(_map);
    } else {
      JsonListCacher(jsonName: widget.JsonTag).addSaved(_map);
    }
    final provider = Provider.of<FilterProvider>(context, listen: false);
    provider.tongleFilter(widget.obj, widget.JsonTag);
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
