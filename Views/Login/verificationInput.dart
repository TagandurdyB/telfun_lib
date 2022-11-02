import 'package:flutter/material.dart';

class EnterOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OTPDigitTextFieldBox(first: true, last: false, index: 0),
          OTPDigitTextFieldBox(first: false, last: false, index: 1),
          OTPDigitTextFieldBox(first: false, last: false, index: 2),
          OTPDigitTextFieldBox(first: false, last: false, index: 3),
          OTPDigitTextFieldBox(first: false, last: false, index: 4),
          OTPDigitTextFieldBox(first: false, last: true, index: 5),
        ],
      ),
    );
  }
}

List<TextEditingController> controls = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];

class OTPDigitTextFieldBox extends StatelessWidget {
  final bool first;
  final bool last;
  final int index;
  const OTPDigitTextFieldBox(
      {Key key,
      @required this.first,
      @required this.last,
      @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: 50,
      child: TextField(
        controller: controls[index],
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && first == false) {
            FocusScope.of(context).previousFocus();
          }
          print("***${controls[index].text}");
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 40),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: Offstage(),
          /* // contentPadding: EdgeInsets.all(0),
          enabledBorder: OutlineInputBorder(
            //  borderSide: BorderSide(width: 1, color: Colors.grey),
            //  borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
           //   borderSide: BorderSide(width: 2, color: Colors.blue),
            //  borderRadius: BorderRadius.circular(10),
          ),
         // hintText: "*",
         // hintStyle: TextStyle(fontSize: 30),*/
        ),
      ),
    );
  }
}

class GetOTP {
  String getCode() {
    String _code = "";
    for (int i = 0; i < 6; i++) {
      _code += controls[i].text;
    }

    return _code;
  }
}
