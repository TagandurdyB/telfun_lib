import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import 'package:telfun/ViewModels/JsonCacher.dart';
import 'package:telfun/ViewModels/JsonDebuger.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Providers/FilterProvider.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/ViewModels/Providers/ValueProvider.dart';
import 'package:telfun/ViewModels/Routes.dart';

import '../ProductPage.dart';
import 'FilterDetalPage.dart';

class FilterListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Json_Get(
      jsonName: JsonTags.filters,
      Return: FliterList(),
    );
  }
}

class FliterList extends StatefulWidget {
  const FliterList({
    Key key,
  }) : super(key: key);

  @override
  _FliterListState createState() => _FliterListState();
}

class _FliterListState extends State<FliterList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FilterProvider>(context, listen: false).reloadSaved();
  }

  @override
  Widget build(BuildContext context) {
    final providerValues = Provider.of<ValuesProvider>(context);
    final providerFilter = Provider.of<FilterProvider>(context);
    List _list = providerFilter.savedFilters;
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
          physics: BouncingScrollPhysics(),
          children: List.generate(_list.length ?? 0, (index) {
            final _obj = _list[index];
            return Card(
              color: ThemeProvided().colorCanvas,
              shadowColor: ThemeProvided().colorText,
              child: ListTile(
                onTap: () {
                  /*   print(
                      "name:${_obj.name}  id:${_obj.id}  filters:${_obj.filters}");*/
                  Provider.of<UsesVar>(context, listen: false)
                      .changeScaffoldTitle("${_obj.name}");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilterDetalPage(
                                body: {
                                  JsonTags.filterMark:
                                      _obj.filters[JsonTags.filterMark],
                                  JsonTags.filterModel:
                                      _obj.filters[JsonTags.filterModel],
                                  JsonTags.filterColor:
                                      _obj.filters[JsonTags.filterColor],
                                  JsonTags.filterEtrap:
                                      _obj.filters[JsonTags.filterEtrap],
                                  JsonTags.filterPrice: {
                                    "min": _obj.filters[JsonTags.filterPrice][0]
                                        ["price"],
                                    "max": _obj.filters[JsonTags.filterPrice][1]
                                        ["price"]
                                  },
                                    JsonTags.filterTime:_obj.filters[JsonTags.filterTime][0]["id"]
                                },
                              )));
                 /* API_Post(URL: "$IP/api/filter", body: {
                    JsonTags.filterMark: _obj.filters[JsonTags.filterMark],
                    JsonTags.filterModel: _obj.filters[JsonTags.filterModel],
                    JsonTags.filterColor: _obj.filters[JsonTags.filterColor],
                    JsonTags.filterEtrap: _obj.filters[JsonTags.filterEtrap],
                    JsonTags.filterPrice: {
                      "min": _obj.filters[JsonTags.filterPrice][0]["price"],
                      "max": _obj.filters[JsonTags.filterPrice][1]["price"]
                    },
                      JsonTags.filterTime:_obj.filters[JsonTags.filterTime][0]["id"]
                  }).filter();*/
                  /*  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductPage(
                                title: "",
                                objs: [],
                              )));*/
                },
                leading: Text("${_obj.name}"),
                trailing: IconButton(
                    onPressed: () {
                      JsonListCacher(jsonName: JsonTags.filters)
                          .removeSaved(providerFilter.filtersMapSave(_obj));
                      Provider.of<FilterProvider>(context, listen: false)
                          .reloadSaved();
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    )),
              ),
            );
          })),
    );
  }
}
