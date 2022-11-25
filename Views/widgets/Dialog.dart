import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';

import 'ReadyInput.dart';

class ActionsTeam {
  final String text;
  final Function func;
  final bool isPopEnable;
  ActionsTeam({this.text, this.func,this.isPopEnable=true});
}

class PopUppWidget {
  final bool isPopEnable;
  final String title;
  final Widget content;
  final List<ActionsTeam> actionsTeam;
  PopUppWidget(
      {this.isPopEnable = true,
      this.actionsTeam,
      this.content,
      this.title = "Main Title"});
  popup(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return ShowingDialog(
          title: title,
          actionsTeam: actionsTeam,
          content: content,
          isPopEnable: isPopEnable,
        );
      },
    );
  }
}


class ShowingDialog extends StatefulWidget {
  final bool isPopEnable;
  final String title;
  final Widget content;
  final List<ActionsTeam> actionsTeam;
  ShowingDialog(
      {this.isPopEnable,
        this.actionsTeam,
        this.content,
        this.title});

  @override
  State<ShowingDialog> createState() => _ShowingDialogState();
}

class _ShowingDialogState extends State<ShowingDialog> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: CupertinoAlertDialog(
        actions: widget.actionsTeam!=null?widget.actionsTeam
            .map(
              (e) => TextButton(
              onPressed: () {
                setState(() {
                  e.func();
                  if (widget.isPopEnable&&e.isPopEnable) Navigator.pop(context);
                });
              },
              child: Text(e.text,style: TextStyle(color: Color(0xff42069A)),)),
        )
            .toList():
        [],
        title: Text(
          widget.title,
          style: TextStyle(fontSize: SWi * 0.05),
        ),
        content: Card(
          shadowColor: Colors.transparent,
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              children: [widget.content],
            ),
          ),
        ),
      ),
    );
  }
}
