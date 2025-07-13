import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domain/ui_helper.dart';

class MyLibraryLikedWidget extends StatelessWidget {
  final bool mLeadingGradient;

  List<Color>? mGradientColors; // it can be null
  Color? mSolidColor;
  IconData mLeadingIcon;
  Color mLeadingIconColor;
  String mTitle;
  String mSubTitle;

  MyLibraryLikedWidget({
    required this.mTitle,
    required this.mSubTitle,
    this.mLeadingIconColor = Colors.white,
    this.mLeadingIcon = Icons.favorite,
    this.mSolidColor = const Color(0xff5E3B7A),
    this.mLeadingGradient = false,
    this.mGradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 60,
        child: Icon(mLeadingIcon, color: mLeadingIconColor),
        decoration: BoxDecoration(
          color: mSolidColor ?? Color(0xff5E3B7A),
          gradient:
              mLeadingGradient
                  ? LinearGradient(
                    colors:
                        mGradientColors ??
                        [
                          Color(0xff4A39EA),
                          Color(0xff868AE1),
                          Color(0xffB9D4DB),
                        ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                  : null,
        ),
      ),
      title: Text(mTitle),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      subtitle: Row(
        children: [
          SvgPicture.asset("assets/svg/pop.svg"),
          mSpacer(mHeight: 4),
          Text(mSubTitle),
        ],
      ),
      subtitleTextStyle: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
