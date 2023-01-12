import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';

import 'RIBase.dart';

enum Type { tel, pass, text, num, email }
/*List<TextEditingController> controls =
    List.generate(10, (index) => TextEditingController());*/

class ReadyInput extends StatefulWidget {
  final int index, maxline;
  final String hidden, label,tag,startVal;
  final bool shape;
  final double borderRad;
  final Type type;
  final Function onChange,suffixFunc;
  final Widget reightWidget;
  ReadyInput(
      {
        this.startVal="",
        this.suffixFunc,
        this.tag,
        this.index = 0,
      this.hidden = "",
      this.shape = false,
      this.type = Type.text,
      this.onChange,
      this.borderRad = 20,
      this.label = "",
      this.maxline = 1,
      this.reightWidget});
  @override
  _ReadyInputState createState() => _ReadyInputState();
}

class _ReadyInputState extends State<ReadyInput> {
  @override
  void initState() {
      RIBase.changeDate(widget.tag,TextEditingController(text:widget.startVal));
/*    controls.forEach((element) {
      element.text = "";
    });*/
/*    if (controls.length < widget.index + 1) {
      controls.add(TextEditingController());
    }*/
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          floatingLabelBehavior:FloatingLabelBehavior.never,
          labelStyle: TextStyle(color: Color(0xffAD88DF)),
          hintStyle: TextStyle(color: Color(0xffAD88DF)),
          focusedBorder: widget.shape?OutlineInputBorder(
            borderRadius:
          BorderRadius.all(Radius.circular(widget.borderRad)),
              borderSide: BorderSide(color: Color(0xff5308BE))):null,
          enabledBorder: widget.shape?OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(widget.borderRad)),
              borderSide: BorderSide(color: Color(0xffAD88DF))):null,
        ),
      ),
      child: TextFormField(
        //initialValue: controls[widget.index].text,
        cursorColor: Color(0xff5308BE),
        maxLines: widget.maxline,
        onChanged: (value) {
          if(widget.onChange!=null)
          widget.onChange(value, widget.tag/*widget.index*/);
        },
        maxLength: widget.type == Type.tel ? 8 : null,
        obscureText: widget.type == Type.pass ? true : false,
        style: ThemeProvided().styleInputText,
        keyboardType: widget.type == Type.text
            ? null
            : widget.type == Type.tel
                ? TextInputType.phone
                : widget.type == Type.pass
                    ? TextInputType.visiblePassword
                    : widget.type == Type.email
                        ? TextInputType.emailAddress
                        : TextInputType.numberWithOptions(),
        controller: RIBase.getControl(widget.tag),//controls[widget.index],
        decoration: InputDecoration(
            prefix: widget.type == Type.tel ? Text("+993") : null,
            hintText: widget.hidden != "" ? widget.hidden : "",
            labelText: widget.label != "" ? widget.label : "",
            suffix: GestureDetector(
                onTap: () {
                RIBase.getControl(widget.tag).clear();
                  //  controls[widget.index].clear();
                if(widget.suffixFunc!=null)
                  widget.suffixFunc();
                },
                child: widget.reightWidget ?? Icon(Icons.cancel,color: ThemeProvided().colorText,))),
      ),
    );
  }
}
