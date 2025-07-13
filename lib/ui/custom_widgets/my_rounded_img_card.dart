import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyRoundedImgCard extends StatelessWidget {
  final double mWidth;
  final double mHeight;
  final String imgPath;
  final bool isSpotifyOriginal;
  final bool isBlackBg;

  const MyRoundedImgCard({
    this.mWidth = 100,
    this.mHeight = 100,
    required this.imgPath,
    this.isSpotifyOriginal = true,
    this.isBlackBg = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mWidth,
      height: mHeight,
      child:
          isSpotifyOriginal
              ? Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11),
                    ),
                    color: isBlackBg ? Colors.white : Colors.black,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/logo/Logo.svg",
                      height: 10,
                      width: 10,

                      color: isBlackBg ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              )
              : Container(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
      ),
    );
  }
}
