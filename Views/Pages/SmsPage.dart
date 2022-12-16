import 'package:flutter/material.dart';
import 'package:telfun/Views/widgets/ReadyInput.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';
import '/Models/Public.dart';
import '/Views/widgets/ScaffoldParts/ScaffoldAll.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: SWi * 0.06),
      child: Column(
        children: [
          buildInput(),
          Divider(color: Colors.purple, height: 10),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: List.generate(
                    100,
                    (index) =>
                        smsTextBox(index, index % 2 == 0 ? true : false, '''
Salam $index''')),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget smsTextBox(int index, bool isSended, String smsText) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: SWi * 0.02),
      alignment: isSended ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: SWi * 0.6,
        alignment: isSended ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Visibility(
                visible: !isSended,
                child: ImgBtn(
                  colors: [Color(0xff6E0EFD), Color(0xffDE7A90)],
                  shape: SWi * 0.08,
                  width: SWi * 0.08,
                  height: SWi * 0.08,
                  child: Text(
                    "TF",
                    style: TextStyle(color: Colors.white, fontSize: SWi * 0.05),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: SWi * 0.01),
              decoration: BoxDecoration(
                color: isSended ? Colors.purple[100] : Color(0xff3C3F41),
                borderRadius:
                    BorderRadiusDirectional.all(Radius.circular(SWi * 0.04)),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: SWi * 0.04, vertical: SWi * 0.02),
              child: Container(
                child: Text(
                  '''$smsText''',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: SWi * 0.04,
                      color: isSended ? Colors.black : Colors.white),
                ),
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }

  Row buildInput() {
    return Row(
      children: [
        Container(
          width: SWi * 0.73,
          child: MyInput(
            shape: true,
            index: 7,
            borderRad: SWi * 0.04,
            hidden: "Habar ýaz...",
            label: "Habarlaş",
            //onControl: (val, index) {},
          ),
        ),
        Container(
          //color: Colors.red,
          padding: EdgeInsets.all(SWi * 0.03),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.send,
              color: Color(0xff9E2CFE),
              size: SWi * 0.065,
            ),
          ),
        ),
      ],
    );
  }
}
