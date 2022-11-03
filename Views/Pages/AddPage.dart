
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/MySnackBar.dart';
import '/ViewModels/ShPBDebug.dart';
import '/Views/widgets/DropDownBtn.dart';
import '/Models/Public.dart';
import '/Models/service.dart';
import '/Views/widgets/AddImg.dart';
import '/Views/widgets/ReadyInput.dart';
import '/ViewModels/ApiDebuging.dart';

class AddPage extends StatelessWidget {
  TextEditingController tel = TextEditingController();
  List<String> inputValues = ["", "", ""];
void canOpenAddBtn(BuildContext context){
 if (controls.where((element) => element.text=="").toList().length==0&&imageOk){
   Provider.of<UsesVar>(context,listen: false).changeCanAdd(true);}
 else{
   Provider.of<UsesVar>(context,listen: false).changeCanAdd(false);
 }

}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyInput(
                  shape: true,
                  index: 0,
                  borderRad: 60,
                  hidden: "Bildirişiň adyny ýazyň...",
                  label: "Bildirişiň ady...",
                  onControl: (val, index) {
                    inputValues[index] = controls[index].text;
                    canOpenAddBtn(context);
                  },
                ),
                MyInput(
                  shape: true,
                  index: 1,
                  type: Type.num,
                  borderRad: 60,
                  hidden: "Bildirişiň bahasyny ýazyň...",
                  label: "Bahasy...",
                  onControl: (val, index) {
                    inputValues[index] = controls[index].text;
                    canOpenAddBtn(context);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //welayats
                      child: DropdawnChange(
                        index: 4,
                        itims: [
                          DropDBid(value: "Aşgabat", id: 0),
                          DropDBid(value: "Ahal", id: 1),
                          DropDBid(value: "Balkan", id: 2),
                          DropDBid(value: "Mary", id: 3),
                          DropDBid(value: "Lebap", id: 4),
                          DropDBid(value: "Daşoguz", id: 5),
                        ],
                      ),
                    ),
                    Container(
                      //marks
                      child: DropdawnChangeOnly(
                        index: 5,
                        itims: List.generate(
                            Get_Lists().getList(Get_Lists.mark).length ?? 0,
                            (index) {
                          var getlist =
                              Get_Lists().getList(Get_Lists.mark)[index];
                          return DropDBid(
                              value: getlist["name"], id: getlist["id"]);
                        }),
                      ),
                    ),
                  ],
                ),
                //categories
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Bölümler:"),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DropdawnChangeOnly(
                      index: 6,
                      itims: List.generate(
                          Get_Lists().getList(Get_Lists.categori).length ?? 0,
                          (index) {
                        var getlist =
                            Get_Lists().getList(Get_Lists.categori)[index];
                        return DropDBid(
                            value: getlist["name"], id: getlist["id"]);
                      }),
                    ),
                  ),
                ]),
                //AddImages(),
                AddImages(),
                MyInput(
                  shape: true,
                  index: 2,
                  maxline: 3,
                  borderRad: 30,
                  hidden: "Bildirişiňiz barada maglumat ýazyň...",
                  label: "Bildiriş barada...",
                  onControl: (val, index) {
                    inputValues[index] = controls[index].text;
                    canOpenAddBtn(context);
                  },
                ),

                AddBtn(inputValues: inputValues),
                /*   Column(children: [
                  Text("${UserProperties.getProperty("id")}"),
                  Text("${UserProperties.getProperty("name")}"),
                  Text("${UserProperties.getProperty("phone")}"),
                  Text("${UserProperties.getProperty("isban")}"),
                ]),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddBtn extends StatefulWidget {
  const AddBtn({Key key, @required this.inputValues}) : super(key: key);

  final List<String> inputValues;

  @override
  _AddBtnState createState() => _AddBtnState();
}

class _AddBtnState extends State<AddBtn> {
  Service service = Service();
  bool _about = false, _isUpload = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Visibility(
          visible: _isUpload,
          child: Column(
            children: [
              CircularProgressIndicator(color: Colors.grey[400]),
              Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Bildirişiňiz goşulýança garaşyň.",
                    style: TextStyle(fontSize: 20, color: Colors.blue[900]),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
        Visibility(
          visible: _about,
          child: Container(
              padding: EdgeInsets.all(8),
              child: Text(
                "Bildirişiňizi goşanyňyzdan soň, tä tassyklanýança halka açylmaýar. "
                "Şol sebäpden garaşmagyňyzy haýyş edýäris. ",
                style: TextStyle(fontSize: 18, color: Colors.blue),
                textAlign: TextAlign.center,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) => MaterialButton(
              onPressed: () async {
                if (Provider.of<UsesVar>(context, listen: false).canAdd()) {
                  setState(() {
                    _isUpload = true;
                    _about = true;
                  });
                  Map<String, String> body = {
                    "category_id": filters[6].id.toString(),
                    "user_id": UserProperties.getProperty("id"),
                    'name': controls[0].text,
                    "mark_id": filters[5].id.toString(),
                    "price": controls[1].text,
                    "place": filters[4].value,
                    "about": controls[2].text,
                  };
                  bool isUpload = await service.addImage(body, [
                     image,
                     image1,
                  ]);
                  if (isUpload) {
                    controls.forEach((element) {
                      element.text = "";
                    });
                    setState(() {
                      _isUpload = false;
                      _about = false;
                      image = null;
                      image1 = null;
                    });
                    MySnack(
                            textColor: Colors.white,
                            message: "Bildiriş goşuldy",
                            textBgColor: Colors.blue)
                        .pushSnack(context);
                    Future.delayed(Duration(seconds: 3)).then((value) =>
                        MySnack(
                                sec: 4,
                                textColor: Colors.white,
                                message: "Tassyklanmagyna garaşyň!",
                                textBgColor: Colors.orange[700])
                            .pushSnack(context));
                    Provider.of<UsesVar>(context, listen: false)
                        .navBarSelect(0);
                  } else {
                    setState(() {
                      _isUpload = false;
                    });
                    MySnack(
                            textColor: Colors.white,
                            textBgColor: Colors.red,
                            message: "Maglumatlary doly giriziň!")
                        .pushSnack(context);
                  }
                } else {}
              },
              height: 50,
              color: Provider.of<UsesVar>(context, listen: false).canAdd()
                  ? Colors.blueAccent
                  : Colors.grey,
              child: Text(
                "Bildiriş goş",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
