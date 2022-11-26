import 'package:flutter/material.dart';

class ImgBtn extends StatelessWidget {
  final double width, height, shape, radius;
  final String bgImg;
  final Color color;
  final onTap;
  final double borderWidth;
  final Color borderColor;
  final Widget child;
  final bool ISsCircle;
  final List<Color> colors;
  final boxShadow;
  ImgBtn(
      {this.width = 100,
      this.height = 100,
      this.radius,
      this.color = Colors.black,
      this.colors,
      this.onTap,
      this.child,
      this.bgImg,
      this.shape = 0,
      this.ISsCircle = false,
      this.boxShadow,
      this.borderWidth,
      this.borderColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    if (ISsCircle) {
      /*  return GestureDetector(
       onTap: onTap,
       child: CircleAvatar(
         */
      /*decoration: BoxDecoration(
           shape: BoxShape.rectangle,
           borderRadius: BorderRadiusDirectional.circular(shape),
           color: color,
         ),*/ /*
        // width: width,
        // height: height,
       //  child: Center(child: child),
         radius: radius,

         backgroundColor: color,
       ),
     );*/
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: radius,
          width: radius,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(bgImg)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                //colors: colors == null ? [color, color] : colors,
              ),
              //borderRadius: BorderRadius.all(Radius.circular(10.0)),
              shape: BoxShape.circle,
              boxShadow: boxShadow),
          // width: width,
          //height: height,
          // child: Center(child: child),
          child: child,
        ),
      );
    } else
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: borderWidth == null
                  ? null
                  : Border.all(width: borderWidth, color: borderColor),
              borderRadius: BorderRadius.all(Radius.circular(shape) //
                  ),
              color: color,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors == null ? [color, color] : colors,
              ),
              boxShadow: boxShadow),
          width: width,
          height: height,
          child: Center(child: child),
        ),
      );
  }
}
