import 'package:flutter/material.dart';

enum Type { tel, pass, text, num, email }
List<TextEditingController> controls = List.generate(10, (index) => TextEditingController());

class MyInput extends StatefulWidget {
  final int index,maxline;
  final String hidden,label;
  final bool shape;
  final double borderRad;
  final Type type;
  final Function onControl;
  MyInput(
      {this.index = 0,
        this.hidden = "",
        this.shape=false,
        this.type = Type.text,
        this.onControl, this.borderRad=20, this.label="", this.maxline=1});
  @override
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  void initState() {
controls.forEach((element) {element.text="";});
/*    if (controls.length < widget.index + 1) {
      controls.add(TextEditingController());
    }*/
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: Color(0xff5308BE),
        maxLines: widget.maxline,
        onChanged: (value) {
          widget.onControl( value,widget.index);
        },
        maxLength: widget.type == Type.tel ? 8 : null,
        obscureText: widget.type == Type.pass ? true : false,
        keyboardType: widget.type == Type.text
            ? null
            : widget.type == Type.tel
            ? TextInputType.phone
            : widget.type == Type.pass
            ? TextInputType.visiblePassword
            : widget.type == Type.email
            ? TextInputType.emailAddress
            : TextInputType.numberWithOptions(),
        controller: controls[widget.index],
        decoration: InputDecoration(
            border: widget.shape?OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRad))):null,
            prefix: widget.type == Type.tel ? Text("+993") : null,
            hintText: widget.hidden!=""?widget.hidden:"",
            labelText: widget.label!=""?widget.label:"",
            suffix: GestureDetector(
                onTap: () {
                  controls[widget.index].clear();
                },
                child: Icon(Icons.cancel))),
      ),
    );
  }
}