import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';


class DropdawnChange extends StatefulWidget {
  final int index;
  final List<DropDBid> itims;
  DropdawnChange({this.index, this.itims});

  @override
  State<DropdawnChange> createState() => _DropdawnChangeState(itims);
}

class _DropdawnChangeState extends State<DropdawnChange> {
 final List<DropDBid> itims;
  _DropdawnChangeState(this.itims);

 String myvalue;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    myvalue=itims[0].value;
    filters[widget.index].value=myvalue;
  /*  if(filters.length<widget.index+1)
    filters.add(myvalue);*/
  }
  @override
  Widget build(BuildContext context) {
  List<String> itims=List.generate(widget.itims.length, (index) => widget.itims[index].value);
    return DropdownButton(
      items: itims.map((val) {
        return DropdownMenuItem(child: Text(val), value: val);
      }).toList(),
      value:filters[widget.index].value,
      onChanged: (String newVal) {
        setState(() {
          myvalue=newVal;
          filters[widget.index].value=myvalue;
        });
      },
    );
  }
}


class DropdawnChangeOnly extends StatefulWidget {
  final int index;
  final List<DropDBid> itims;
  DropdawnChangeOnly({this.index, this.itims});

  @override
  State<DropdawnChangeOnly> createState() => _DropdawnChangeStateOnly(itims);
}

class _DropdawnChangeStateOnly extends State<DropdawnChangeOnly> {
  final List<DropDBid> itims;
  _DropdawnChangeStateOnly(this.itims);

  String myvalue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myvalue=itims[0].id.toString();
    filters[widget.index].id=int.parse(myvalue);
    /*  if(filters.length<widget.index+1)
    filters.add(myvalue);*/
  }
  @override
  Widget build(BuildContext context) {
    //List<String> itims=List.generate(widget.itims.length, (index) => widget.itims[index].value);
    return DropdownButton(
      items: itims.map((val) {
        return DropdownMenuItem(child: Text(val.value), value: val.id.toString());
      }).toList(),
      value:filters[widget.index].id.toString(),
      onChanged: (String newVal) {
        print("${newVal}");
        setState(() {
          myvalue=newVal;
          filters[widget.index].id=int.parse(myvalue);
        });
      },
    );
  }
}