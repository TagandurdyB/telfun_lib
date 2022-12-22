import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/widgets/DropDownBtn/DDBBase.dart';
import '/ViewModels/Names.dart';
import '/Views/widgets/Dialog.dart';
import '/Views/widgets/ReadyInput/RIBase.dart';
import '/Models/Public.dart';
import '/ViewModels/ShPBDebug.dart';
import '/Models/service.dart';
import 'AddImg.dart';
import 'ScaffoldParts/MySnackBar.dart';

class AddShopBtn extends StatefulWidget {
  @override
  _AddShopBtnState createState() => _AddShopBtnState();
}

class _AddShopBtnState extends State<AddShopBtn> {
  Service service = Service(Url: '$IP/api/shop_add');
  bool _about = false, _isUpload = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SWi * 0.2),
          child: Builder(
            builder: (context) => ClipRRect(
              borderRadius: BorderRadius.circular(SWi * 0.05),
              child: MaterialButton(
                onPressed: () async {
                  if (Provider.of<UsesVar>(context, listen: false).canAdd) {
                    setState(() {
                      _isUpload = true;
                      _about = true;
                    });
                    FocusScope.of(context).unfocus();
                    PopUppWidget(
                        /* actionsTeam: [
                          ActionsTeam(text: "",func: (){})
                        ],*/
                        isPopEnable: false,
                        title: "",
                        content: Container(
                          width: 200,
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Visibility(
                                visible: _isUpload,
                                child: Column(
                                  children: [
                                    CircularProgressIndicator(
                                        color: Colors.grey[400]),
                                    Container(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          "Dükanyňyz açylýança garaşyň.",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: ThemeProvided().colorText),
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
                                      "Dükan açanyňyzdan soň, tä tassyklanýança halka açylmaýar. "
                                      "Şol sebäpden garaşmagyňyzy haýyş edýäris. ",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ],
                          ),
                        )).popUpCupertino(context);
                    /*
           *** Text("image"),
            Text("place"),
            Text("phone"),
            Text("about"),*/
                    Map<String, String> body = {
                      "user_id": UserProperties.getProperty("id"),
                      'name': RIBase.getText(RITags.rIName),
                      "place":DDBBase.getDate(DDBTags.dDBLocation).id.toString(),
                      "about": RIBase.getText(RITags.rIAbout),//controls[2].text,
                      "phone":UserProperties.getProperty("phone"),
                    };
                    bool isUpload = await service.addImage(body, images);
                    if (isUpload) {
                 /*     controls.forEach((element) {
                        element.text = "";
                      });*/
                      setState(() {
                        _isUpload = false;
                        _about = false;
                        images = [];
                      });
                      MySnack(
                              textColor: Colors.white,
                              message: "Dükan ugradyldy",
                              textBgColor: Color(0xff5308BE))
                          .pushSnack(context);
                      MySnack(
                          sec: 4,
                          textColor: Colors.white,
                          message: "Tassyklanmagyna garaşyň!",
                          textBgColor: Colors.orange[700]).pushSnack(context);
                      Navigator.pop(context);
                      Provider.of<UsesVar>(context, listen: false)
                          .navBarSelect(0);
                      Future.delayed(Duration(seconds: 7)).then((value) =>
                          Navigator.popUntil(context, (route) => route.isFirst));
                    } else {
                      setState(() {
                        _isUpload = false;
                      });
                      Navigator.pop(context);
                      MySnack(
                              textColor: Colors.white,
                              textBgColor: Colors.red,
                              message: "Maglumatlary doly giriziň!")
                          .pushSnack(context);
                    }
                  } else {}
                },
                height: 50,
                color: Provider.of<UsesVar>(context, listen: false).canAdd
                    ? Color(0xff5408BF)
                    : Colors.grey,
                child: Text(
                  "Dükan aç",
                  style: TextStyle(color: Colors.white, fontSize: SWi * 0.05),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
