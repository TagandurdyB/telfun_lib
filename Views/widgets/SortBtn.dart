import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DDBBase.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/Names.dart';

import 'Dialog.dart';
import 'DropDownBtn/DropDownBtn.dart';
import 'imgBtn.dart';

class SortBtn extends StatefulWidget {
  const SortBtn({
    Key key,
  }) : super(key: key);

  @override
  _SortBtnState createState() => _SortBtnState();
}

class _SortBtnState extends State<SortBtn> {

  @override
  Widget build(BuildContext context) {
    return ImgBtn(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.sort,
          color: Color(0xff8017FF),
          size: SWi * 0.07,
        ),
      ),
      width: null,
      height: null,
      color: Colors.transparent,
      onTap: () {
        PopUppWidget(
          centerTitle: true,
          title: "Tertipleşdirme",
          content: Column(
            children: [
              sortGroup(),

            ],
          ),
        ).popUp(context);
      },
    );
  }

  Column sortGroup() {
    //final provider=Provider.of<UsesVar>(context);
   // bool _isDEC=false;
    final provider=Provider.of<UsesVar>(context,listen: false);
    return Column(
              children: [
                ImgBtn(
                  child: Row(
                    children: [
                      Icon(provider.sortNum!=0?Icons.adjust_outlined:Icons.album_outlined,
                          size: 40, color:provider.sortNum!=0? Colors.grey[400]:Colors.purple),
                      Text("  Asyl tertip", style: TextStyle(fontSize: SWi * 0.04,color: ThemeProvided().colorText)),
                    ],
                  ),
                  onTap: () {
                    print("0");
                   provider.changeSort(0);
                   Navigator.pop(context);
                  },
                  width: null,
                  height: SWi * 0.15,
                  color: Colors.transparent,
                ),
                ImgBtn(
                  child: Row(
                    children: [
                      Icon(provider.sortNum!=1?Icons.adjust_outlined:Icons.album_outlined,
                          size: 40, color:provider.sortNum!=1?Colors.grey[400]:Colors.purple),
                      Text("  Arzandan gymmada", style: TextStyle(fontSize: SWi * 0.04,color: ThemeProvided().colorText)),
                    ],
                  ),
                  onTap: () {
                    provider.changeSort(1);
                    Navigator.pop(context);
                  },
                  width: null,
                  height: SWi * 0.15,
                  color: Colors.transparent,
                ),
                ImgBtn(
                  child: Row(
                    children: [
                      Icon(provider.sortNum!=2?Icons.adjust_outlined:Icons.album_outlined,
                          size: 40, color:provider.sortNum!=2? Colors.grey[400]:Colors.purple),
                      Text("  Gymmatdan arzana", style: TextStyle(fontSize: SWi * 0.04,color: ThemeProvided().colorText)),
                    ],
                  ),
                  onTap: () {
                    print("salam");
                    provider.changeSort(2);
                    Navigator.pop(context);
                  },
                  width: null,
                  height: SWi * 0.15,
                  color: Colors.transparent,
                ),

              ],
            );
  }
}
