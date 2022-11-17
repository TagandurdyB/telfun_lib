import 'package:flutter/material.dart';
import 'package:telfun/Models/DDBBase.dart';
import 'package:telfun/ViewModels/Names.dart';
import '/Models/Public.dart';

import 'DropDownBtn/DropDownBtn.dart';
import 'imgBtn.dart';

class MyDropdown extends StatefulWidget {
  // const MyDropdown({Key? key}) : super(key: key);
  final String hidden,tag;
  final Function onChande,onTop;
  final Widget hint,child;
  final IconData icon;
  final List<DDBEl> items;

  const MyDropdown({Key key, this.hidden, this.icon, this.items, this.tag, this.onChande, this.hint, this.child, this.onTop})
      : super(key: key);

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}
class _MyDropdownState extends State<MyDropdown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ImgBtn(
          width: SWi * 0.1,
          height: SWi * 0.1,
          shape: 10,
          color: Color(0xff5408BF),
          child: Icon(
            widget.icon,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropDownBtn(
              onChanged: (value){
                widget.onChande==null?print(""):widget.onChande(value);
                setState(() {
                });
              },
              onTap:widget.onTop,
              hint: widget.hint,
              hideText: widget.hidden,
              tag:widget.tag,
              items: widget.items,
            ),
          ),
        ),
      ],
    );
  }
}