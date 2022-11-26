import 'package:flutter/material.dart';
import '/Models/Public.dart';

class DrawBarBtn extends StatelessWidget {
  Widget leading, title, trailing;
  double titleLeft;
  double width;
  Color color;
  Function onTap;
  DrawBarBtn(
      {@required this.leading,
      @required this.title,
      @required this.trailing,
        this.titleLeft,
      this.onTap,
      this.color = Colors.transparent,
      this.width = double.infinity});
  @override
  Widget build(BuildContext context) {
    leading=leading==null?Container():leading;
    title=title==null?Container():title;
    trailing=trailing==null?Container():trailing;
    return GestureDetector(
      onTap: () {
        onTap(context);
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadiusDirectional.circular(SWi * 0.03),
          color: color,
        ),
        width: width,
        padding: EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: SWi * 0.17,
            ),
            Positioned(child: leading, left: 2),
            Positioned(
                left: titleLeft,
                child: title),
            Positioned(child: trailing, right: 2),
          ],
        ),
      ),
    );
  }
}
