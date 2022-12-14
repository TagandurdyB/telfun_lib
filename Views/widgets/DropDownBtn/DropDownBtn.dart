import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';
import '/Models/DDBBase.dart';


class DropDownBtn extends StatefulWidget {
final String tag,hideText;
final Widget hint;
final List<DDBEl> items;
final Function onChanged,onTap;
  const DropDownBtn({Key key, this.tag, this.items, this.hideText, this.onChanged, this.hint, this.onTap}) : super(key: key);

  @override
  State<DropDownBtn> createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {
  String dropdownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.hideText==null){
      dropdownValue=widget.items[0].index.toString();
      DropDownBase.addAll({widget.tag:widget.items[0]});
    }else {
      DropDownBase.addAll({widget.tag:null});
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        hint: widget.hideText==null?widget.hint!=null?widget.hint:null:Container(
          child: Text(
            widget.hideText,
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.end,
          ),
        ),
        isExpanded: true,
        items: widget.items.map((val) {
          return DropdownMenuItem(
              child: val.child==null?Text(val.value):val.child, value: val.index.toString());
        }).toList(),
        value: DropDownBase[widget.tag]==null?dropdownValue:
        DropDownBase[widget.tag].index.toString(),
        onTap: (){
          setState(() {
            widget.onTap;
          });
        },
        //filters[widget.index].id.toString(),
        onChanged: (String newVal) {
          if(int.parse(newVal)>widget.items.length-1)newVal=widget.items.last.index.toString();
          setState(() {
            dropdownValue = newVal;
            DropDownBase.addAll({widget.tag:widget.items[int.parse(dropdownValue)]});
            widget.onChanged(newVal);
          });
        },
      ),
    );
  }
}

class DropDownBtnUnVal extends StatefulWidget {
  final String tag,hideText;
  final Widget hint;
  final List<DDBEl> items;
  final Function onChanged,onTap;
  const DropDownBtnUnVal({Key key, this.tag, this.items, this.hideText, this.onChanged, this.hint, this.onTap}) : super(key: key);

  @override
  State<DropDownBtnUnVal> createState() => _DropDownBtnUnValState();
}

class _DropDownBtnUnValState extends State<DropDownBtnUnVal> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.hideText==null){
      DropDownBase.addAll({widget.tag:widget.items[0]});
    }else {
      DropDownBase.addAll({widget.tag:null});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: SWi*0.02),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: widget.hideText==null?widget.hint!=null?widget.hint:null:Container(
            child: Text(
              widget.hideText,
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),
              textAlign: TextAlign.end,
            ),
          ),
          isExpanded: true,
          items: widget.items.map((val) {
            return DropdownMenuItem(
                child: val.child==null?Text(val.value):val.child, value: val.index.toString());
          }).toList(),
        /*  value: DropDownBase[widget.tag]==null?dropdownValue:
          DropDownBase[widget.tag].index.toString(),*/
          onTap: (){
            setState(() {
              if(widget.onTap!=null)
              widget.onTap();
            });
          },
          //filters[widget.index].id.toString(),
          onChanged: (String newVal) {
            if(int.parse(newVal)>widget.items.length-1)newVal=widget.items.last.index.toString();
            setState(() {
              DropDownBase.addAll({widget.tag:widget.items[int.parse(newVal)]});
              widget.onChanged(widget.items[int.parse(newVal)]);
            });
          },
        ),
      ),
    );
  }
}

