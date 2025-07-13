import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCircularImgBg extends StatelessWidget {
  final double mWidth;
  final double mHeight;
  final String imgPath;
  final bool isSelected;

  const MyCircularImgBg({
    this.mWidth = 100,
    this.mHeight = 100,
    required this.imgPath,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mWidth,
      height: mHeight,
      child:
          isSelected
              ? Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  radius: mWidth / 2,
                  child: Icon(Icons.done, color: Colors.black),
                ),
              )
              : Container(),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.white : Colors.transparent,
          width: isSelected ? 2 : 0,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
      ),
    );
  }
}
