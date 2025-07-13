import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ye hmra button ka class bna h jaha v eska jarurt higa vha es button ke class ko cal krenge
// jaise v button chahiye sb kus yhi krenge jise paa=dding , color, textstle etc. bs jaha jarurrt rhega vha cakk kr kenge, sb kus yha banaye h jb call krenge to to color .... denge
class MyCustomRoundedBtn extends StatelessWidget {
  VoidCallback onTap;
  double mWidth;
  double mHeight;
  Color bgColor;
  String text;
  Color textColor;
  String? mIconPath;
  bool isOutlined;

  MyCustomRoundedBtn({
    required this.onTap,
    required this.text,
    this.textColor = Colors.black,
    this.mIconPath,
    this.mWidth = 300,
    this.mHeight = 50,
    this.bgColor = Colors.white,
    this.isOutlined=false
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: mWidth,
        height: mHeight,
        child:
            mIconPath != null
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Row(
                    children: [
                      SvgPicture.asset(mIconPath!, width: 25, height: 25),
                      Expanded(child: Center(child: Text(text))),
                    ],
                  ),
                )
                : Center(child: Text(text, style: TextStyle(color: textColor,fontSize: 16,fontWeight: FontWeight.bold, ),)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isOutlined ? Colors.transparent : bgColor,
          border: isOutlined ? Border.all(
            width: 1,
            color: isOutlined ? Colors.white :Colors.transparent
          ) : null
        ),
      ),
    );
  }
}
