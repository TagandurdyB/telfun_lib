import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Providers/FilterProvider.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/ViewModels/Providers/ValueProvider.dart';
import 'package:telfun/Views/widgets/FilterSwitch.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';

class PopStateFull {
  final BuildContext context;
  bool isCheck;
  final List list;
  final int welayatIndex;
  final String title, jsonTag, apiTag;
  PopStateFull(
      {this.welayatIndex,
      this.apiTag,
      this.jsonTag,
      this.context,
      this.list,
      this.isCheck,
      this.title});
  get pop => showDialog(
      context: context,
      builder: (context) => CheckList(
            title: title,
            list: list,
            jsonTag: jsonTag,
            apiTag: apiTag,
            welayatIndex: welayatIndex,
          ));
}

class CheckList extends StatefulWidget {
  bool isCheck;
  final List list;
  final int welayatIndex;
  final String title, jsonTag, apiTag;
  CheckList(
      {this.welayatIndex,
      this.list,
      this.isCheck,
      this.title,
      this.jsonTag,
      this.apiTag});

  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {

  @override
  Widget build(BuildContext context) {
    return buildScaffold(context, widget.title);
  }

  Scaffold buildScaffold(BuildContext context, String title) {
    final providerValues = Provider.of<ValuesProvider>(context);
    final providerFilter = Provider.of<FilterProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.black26,
        alignment: Alignment.center,
        child: ImgBtn(
          color: ThemeProvided().colorModel,
          width: SWi * 0.8,
          height: SHe * 0.8,
          shape: SWi * 0.02,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  title + " :",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: SWi * 0.04),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(widget.list.length + 1, (index) {
                      final int lengthValues = providerValues.all(widget.apiTag).length;
                      if (index == 0) {
                        return FilterSwitch(
                          title: "Ähli",
                          jsonTag: widget.jsonTag,
                          apiTag: widget.apiTag,
                          objs: widget.apiTag == ApiTags.etraps
                              ? providerValues
                                  .placeEtrapObjs(widget.welayatIndex)
                              :widget.apiTag == ApiTags.place?
                          providerValues.all(ApiTags.etraps)
                              : providerValues.all(widget.apiTag),
                          isCheck: widget.apiTag == ApiTags.etraps
                              ? providerFilter
                                      .findEtrapObjs(widget.welayatIndex + 1)
                                      .length ==
                                  providerValues
                                      .placeEtrapObjs(widget.welayatIndex)
                                      .length
                              : widget.apiTag == ApiTags.place?
                              providerFilter.filter(JsonTags.filterEtrap).length==
                                  providerValues.all(ApiTags.etraps).length
                              :providerFilter.filter(widget.jsonTag).length == lengthValues,
                        );
                      }
                      if (title == "Ýerleşýän ýeri") {
                        final _obj = widget.list[index - 1];
                        return Card(
                          color: ThemeProvided().colorCanvas,
                          shadowColor: ThemeProvided().colorText,
                          child: ListTile(
                            leading: Text(_obj.name,
                                style: ThemeProvided().styleUserPage),
                            onTap: () {
                              final List _etrabs =
                                  providerValues.placeEtrapObjs(_obj.id - 1);
                              PopStateFull(
                                      welayatIndex: _obj.id - 1,
                                      context: context,
                                      list: _etrabs,
                                      title: "${_obj.name} welaýat",
                                      jsonTag: JsonTags.filterEtrap,
                                      apiTag: ApiTags.etraps)
                                  .pop;
                            },
                            title: Container(
                              alignment: Alignment.centerRight,
                              child: providerFilter
                                          .findEtrapObjs(_obj.id)
                                          .length ==
                                      0
                                  ? null
                                  : providerFilter
                                              .findEtrapObjs(_obj.id)
                                              .length ==
                                          providerValues
                                              .placeEtrapObjs(_obj.id - 1)
                                              .length
                                      ? Text("Ähli",
                                          style: ThemeProvided().styleDisable)
                                      : Text(
                                          "(${providerFilter.findEtrapObjs(_obj.id).length})",
                                          style: ThemeProvided().styleDisable),
                            ),
                            trailing: Checkbox(
                              side:
                                  BorderSide(color: ThemeProvided().colorText),
                              value: providerFilter
                                      .findEtrapObjs(_obj.id)
                                      .length ==
                                  providerValues
                                      .placeEtrapObjs(_obj.id - 1)
                                      .length,
                              //providerFilter.isExist(_obj, widget.jsonTag),
                              onChanged: (bool _val) {
                                FilterFuncGroup(
                                  objs: providerValues
                                      .placeEtrapObjs(_obj.id - 1),
                                  isCheck: !_val,
                                  jsonTag: JsonTags.filterEtrap,
                                  apiTag: ApiTags.etraps,
                                ).allSwitch(context);
                              },
                            ),
                          ),
                        );
                      } else {
                        final _obj = widget.list[index - 1];
                        return FilterSwitch(
                          func: () {},
                          isCheck: providerFilter.isExist(_obj, widget.jsonTag),
                          // isCheck: false,
                          jsonTag: widget.jsonTag,
                          title: _obj.name,
                          obj: _obj,
                        );
                      }
                    }),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(8),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Tamam")))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
