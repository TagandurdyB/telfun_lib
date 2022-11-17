import 'package:flutter/material.dart';
import 'package:telfun/Models/DDBBase.dart';
import 'package:telfun/ViewModels/Names.dart';
import '/Views/widgets/MyDropdown.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/widgets/AddBtn.dart';
import '../widgets/DropDownBtn/DropDownBtn.dart';
import '/Views/widgets/ReadyInput.dart';
import '/Views/widgets/imgBtn.dart';

class AddNewPage extends StatefulWidget {
  //const AddNewPage({Key? key}) : super(key: key);
  @override
  _AddNewPageState createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  int modelIndex;

  Widget DDColor = MyDropdown(
    tag: DDBName.dDBColor,
    hidden: "Reňki",
    icon: Icons.palette_outlined,
    items: DDBBase().getDate(DDBName.dDBModel).index == -1
        ? [DDBEl(id: 0, index: -1, value: "")]
        : List.generate(
            Get_Lists()
                    .getList(Get_Lists.model)[
                        DDBBase().getDate(DDBName.dDBModel).index]["color"]
                    .length ??
                0, (index) {
            var getlist = Get_Lists().getList(Get_Lists.model)[
                DDBBase().getDate(DDBName.dDBModel).index]["color"][index];
            int code = int.parse("0xff${getlist["code"].substring(1)}");
            return DDBEl(
                child: Row(
                  children: [
                    ImgBtn(
                      width: 30,
                      height: 30,
                      color: Color(code),
                      shape: 2,
                      boxShadow: [
                        BoxShadow(color: Colors.grey[400], blurRadius: 1)
                      ],
                    ),
                    Text(getlist["tm"]),
                  ],
                ),
                index: index,
                value: getlist["tm"],
                id: getlist["id"]);
          }),
  );

  @override
  Widget build(BuildContext context) {
    print("*****************${DropDownBase[DDBName.dDBModel]}");
    return Container(
        padding: EdgeInsets.symmetric(horizontal: SWi * 0.08),
        //color: Colors.blue,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyDropdown(
                tag: DDBName.dDBCategory,
                hidden: "Bölümler",
                icon: Icons.category,
                items: List.generate(
                    Get_Lists().getList(Get_Lists.categori).length ?? 0,
                    (index) {
                  var getlist = Get_Lists().getList(Get_Lists.categori)[index];
                  return DDBEl(
                      value: getlist["tm"], id: getlist["id"], index: index);
                }),
              ),
              MyDropdown(
                hidden: "Marka",
                icon: Icons.bookmark,
                tag: DDBName.dDBMark,
                items: List.generate(
                    Get_Lists().getList(Get_Lists.mark).length ?? 0, (index) {
                  var getlist = Get_Lists().getList(Get_Lists.mark)[index];
                  return DDBEl(
                      value: getlist["name"], id: getlist["id"], index: index);
                }),
              ),
              MyDropdown(
                onTop: (){
                  setState(() {
                    DDBBase().eraseDate(DDBName.dDBModel);
                  });
                },
                onChande: (value) {
                  setState(() {
                    DDColor = Builder(
                      builder: (context)=> MyDropdown(
                        tag: DDBName.dDBColor,
                        hidden: "Reňki",
                        icon: Icons.palette_outlined,
                        items: DDBBase().getDate(DDBName.dDBModel).index == -1
                            ? [DDBEl(id: 0, index: -1, value: "")]
                            : List.generate(
                                Get_Lists()
                                        .getList(Get_Lists.model)[DDBBase()
                                            .getDate(DDBName.dDBModel)
                                            .index]["color"]
                                        .length ??
                                    0, (index) {
                                var getlist =
                                    Get_Lists().getList(Get_Lists.model)[DDBBase()
                                        .getDate(DDBName.dDBModel)
                                        .index]["color"][index];
                                int code = int.parse(
                                    "0xff${getlist["code"].substring(1)}");
                                return DDBEl(
                                    child: Row(
                                      children: [
                                        ImgBtn(
                                          width: 30,
                                          height: 30,
                                          color: Color(code),
                                          shape: 2,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey[400],
                                                blurRadius: 1)
                                          ],
                                        ),
                                        Text(getlist["tm"]),
                                      ],
                                    ),
                                    index: index,
                                    value: getlist["tm"],
                                    id: getlist["id"]);
                              }),
                      ),
                    );
                  });
                },
                hidden: "Model",
                tag: DDBName.dDBModel,
                icon: Icons.view_in_ar_sharp,
                items: List.generate(
                    Get_Lists().getList(Get_Lists.model).length ?? 0, (index) {
                  var getlist = Get_Lists().getList(Get_Lists.model)[index];
                  return DDBEl(
                      index: index, value: getlist["name"], id: getlist["id"]);
                }),
              ),
              DDColor,
              MyDropdown(
                tag: DDBName.dDBLocation,
                hidden: "Ýerleşýän ýeri",
                icon: Icons.location_on_outlined,
                items: [
                  DDBEl(id: 1, index: 0, value: "Asgabat"),
                  DDBEl(id: 2, index: 1, value: "Ahal"),
                  DDBEl(id: 3, index: 2, value: "Balkan"),
                  DDBEl(id: 4, index: 3, value: "Mary"),
                  DDBEl(id: 5, index: 4, value: "Lebap"),
                  DDBEl(id: 6, index: 5, value: "Daşoguz"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImgBtn(
                    width: SWi * 0.1,
                    height: SWi * 0.1,
                    shape: 10,
                    color: Color(0xff5408BF),
                    child: Icon(
                      Icons.money_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyInput(
                        shape: true,
                        index: 1,
                        type: Type.num,
                        // borderRad: 60,
                        hidden: "Bildirişiň bahasyny ýazyň...",
                        label: "Bahasy",
                        onControl: (val, index) {
                          // inputValues[index] = controls[index].text;
                          // canOpenAddBtn(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              /* Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImgBtn(
                    width: SWi * 0.1,
                    height: SWi * 0.1,
                    shape: 10,
                    color: Color(0xff5408BF),
                    child: Icon(
                      Icons.app_registration_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Barada",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              MyInput(
                shape: true,
                index: 2,
                maxline: 3,
                borderRad: 30,
                hidden: "Bildirişiňiz barada maglumat ýazyň...",
                label: "Bildiriş barada...",
                onControl: (val, index) {
                  //inputValues[index] = controls[index].text;
                  // canOpenAddBtn(context);
                },
              ),*/
              AddBtn()
            ],
          ),
        ));
  }
}
