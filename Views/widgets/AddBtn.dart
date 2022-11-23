import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/DDBBase.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DropDownBtn.dart';
import '/Models/Public.dart';
import '/ViewModels/ShPBDebug.dart';
import '/Models/service.dart';
import 'AddImg.dart';
import 'ReadyInput.dart';
import 'ScaffoldParts/MySnackBar.dart';

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
          padding:  EdgeInsets.symmetric(horizontal: SWi*0.2),
          child: Builder(
            builder: (context) => ClipRRect(
              borderRadius: BorderRadius.circular(SWi*0.05),
              child: MaterialButton(
                onPressed: () async {
                  if (Provider.of<UsesVar>(context, listen: false).canAdd()) {
                    setState(() {
                      _isUpload = true;
                      _about = true;
                    });
                    Map<String, String> body = {
                      "category_id": DDBBase().getDate(DDBName.dDBCategory).id.toString(),
                      "user_id": UserProperties.getProperty("id"),
                      'name': controls[0].text,
                      "mark_id":DDBBase().getDate(DDBName.dDBMark).id.toString(),
                      "price": controls[1].text,
                      "place": DDBBase().getDate(DDBName.dDBLocation).value,
                      "about": controls[2].text,
                    };
                    bool isUpload = await service.addImage(body, images);
                    if (isUpload) {
                      controls.forEach((element) {
                        element.text = "";
                      });
                      setState(() {
                        _isUpload = false;
                        _about = false;
                        images=[];
                      });
                      MySnack(
                          textColor: Colors.white,
                          message: "Bildiriş ugradyldy",
                          textBgColor: Color(0xff5308BE))
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
                    ? Color(0xff5408BF)
                    : Colors.grey,
                child: Text(
                  "Bildiriş goş",
                  style: TextStyle(color: Colors.white,fontSize: SWi*0.05),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}