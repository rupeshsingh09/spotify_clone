import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_color.dart';
import 'package:palette_generator/palette_generator.dart';

Widget mSpacer({double mWidth = 11, double mHeight = 11}) =>
    SizedBox(width: mWidth, height: mHeight);

InputDecoration getCreateAccTextFieldDecoration() => InputDecoration(
  filled: true,
  fillColor: AppColor.greyColor,
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
  ),
);

InputDecoration getSearchTextFieldDecoration({
  IconData mIcon = Icons.search,
  Color bgColor = Colors.white,
  String mText = "Search",
}) => InputDecoration(
  filled: true,
  fillColor: bgColor,
  hintText: mText,
  prefixIcon: Icon(mIcon),
  hintStyle: TextStyle(color: AppColor.secondaryBlackColor),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
  ),
);

Future<PaletteGenerator> getColorPalette(String imgPath) async {
  return await PaletteGenerator.fromImageProvider(AssetImage(imgPath));
}
