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
  final String title, jsonTag, apiTag;
  PopStateFull(
      {this.apiTag,
      this.jsonTag,
      this.context,
      this.list,
      this.isCheck,
      this.title});
  get pop => showDialog(
      context: context,
      builder: (context) => CheckList(
          title: title, list: list, jsonTag: jsonTag, apiTag: apiTag));
}

class CheckList extends StatefulWidget {
  bool isCheck;
  final List list;
  final String title, jsonTag, apiTag;
  CheckList({this.list, this.isCheck, this.title, this.jsonTag, this.apiTag});

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
                      if (index == 0) {
                        final int lengthValues=providerValues.all(widget.apiTag).length;
                        final int lengthFilter=providerFilter.filter(widget.jsonTag).length;
                        return FilterSwitch(
                          title: "Ähli",
                          jsonTag: widget.jsonTag,
                          apiTag: widget.apiTag,
                          isCheck: lengthFilter==lengthValues,
                        );
                      }
                      if (title == "Ýerleşýän ýeri") {
                        final _obj = widget.list[index - 1];
                        return SwitchListTile(
                            title: Text(_obj.name,
                                style: ThemeProvided().styleUserPage),
                            value: false,
                            onChanged: (bool _val) {
                              final List _etrabs =
                                  providerValues.etrapObjs(_obj.id - 1);
                              PopStateFull(
                                      context: context,
                                      list: _etrabs,
                                      title: "Etrap",
                                      jsonTag: JsonTags.filterEtrap,
                                      apiTag: ApiTags.place
                              )
                                  .pop;
                            });
                      } else {
                        final _obj = widget.list[index - 1];
                        return FilterSwitch(
                          func: () {},
                          isCheck: providerFilter.isExist(_obj, widget.jsonTag),
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
