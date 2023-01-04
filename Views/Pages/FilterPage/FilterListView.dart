import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/JsonCacher.dart';
import 'package:telfun/ViewModels/JsonDebuger.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Providers/FilterProvider.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/ViewModels/Providers/ValueProvider.dart';

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
    _list.forEach((element) {
      print("filters :=${element.name}");
    });
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
          physics: BouncingScrollPhysics(),
          children: List.generate(_list.length ?? 0, (index) {
            final _obj=_list[index];
            return Card(
              color: ThemeProvided().colorCanvas,
              shadowColor: ThemeProvided().colorText,
              child: ListTile(
                leading: Text("${_obj.name}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        )),
                    IconButton(
                        onPressed: () {
                          JsonListCacher(jsonName: JsonTags.filters)
                              .removeSaved(providerFilter.filtersMap(_obj));
                          Provider.of<FilterProvider>(context,listen: false).reloadSaved();
                        },
                        icon: Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        )),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
