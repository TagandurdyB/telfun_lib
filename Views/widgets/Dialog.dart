import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import '/Models/Public.dart';

enum DialogType { cubertino, normal }
enum PopTheme { light, dark }

class ActionsTeam {
  final String text;
  final Function func;
  final bool isPopEnable;
  ActionsTeam({this.text, this.func, this.isPopEnable = true});
}

class PopUppWidget {
  final bool centerTitle;
  final Color bgColor;
  final bool isPopEnable;
  final String title;
  final PopTheme Theme;
  final Widget content;
  final List<ActionsTeam> actionsTeam;
  PopUppWidget(
      {this.centerTitle = false,
      this.bgColor,
      this.Theme,
      this.isPopEnable = true,
      this.actionsTeam,
      this.content,
      this.title = "Main Title"});
  popUpCupertino(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return ShowingDialog(
          theme: Theme,
          type: DialogType.cubertino,
          title: title,
          actionsTeam: actionsTeam,
          content: content,
          isPopEnable: isPopEnable,
        );
      },
    );
  }

  popUp(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return ShowingDialog(
          centerTitle: centerTitle,
          bgColor: bgColor,
          theme: Theme,
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
  final bool centerTitle;
  final Color bgColor;
  final DialogType type;
  final bool isPopEnable;
  final PopTheme theme;
  final String title;
  final Widget content;
  final List<ActionsTeam> actionsTeam;
  ShowingDialog(
      {this.centerTitle,
      this.bgColor,
      this.type = DialogType.normal,
      this.isPopEnable,
      this.actionsTeam,
      this.content,
      this.title,
      this.theme});

  @override
  State<ShowingDialog> createState() => _ShowingDialogState();
}

class _ShowingDialogState extends State<ShowingDialog> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: widget.theme != null
          ? widget.theme == PopTheme.light
              ? ThemeData.light()
              : ThemeData.dark()
          : ThemeProvided().getTheme()
              ? ThemeData.light()
              : ThemeData.dark(),
      child: widget.type == DialogType.cubertino
          ? CupertinoAlertDialog(
              actions: widget.actionsTeam != null
                  ? widget.actionsTeam
                      .map(
                        (e) => TextButton(
                            onPressed: () {
                              setState(() {
                                e.func();
                                if (widget.isPopEnable && e.isPopEnable)
                                  Navigator.pop(context);
                              });
                            },
                            child: Text(
                              e.text,
                              style: TextStyle(color: Color(0xff42069A)),
                            )),
                      )
                      .toList()
                  : [],
              title: Text(
                widget.title,
                style: TextStyle(
                    fontSize: SWi * 0.05, color: ThemeProvided().colorText),
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
            )
          : widget.type == DialogType.normal
              ? AlertDialog(
                  title: Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: SWi * 0.05, color: ThemeProvided().colorText),
                    textAlign:
                        widget.centerTitle == true ? TextAlign.center : null,
                  ),
                  backgroundColor: widget.bgColor == null
                      ? ThemeProvided().colorCanvas
                      : widget.bgColor,
                  actions: widget.actionsTeam != null
                      ? widget.actionsTeam
                          .map(
                            (e) => TextButton(
                                onPressed: () {
                                  setState(() {
                                    e.func();
                                    if (widget.isPopEnable && e.isPopEnable)
                                      Navigator.pop(context);
                                  });
                                },
                                child: Text(
                                  e.text,
                                  style: TextStyle(color: Color(0xff42069A)),
                                )),
                          )
                          .toList()
                      : [],
                  content: Card(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [widget.content],
                      ),
                    ),
                  ),
                )
              : Container(),
    );
  }
}
