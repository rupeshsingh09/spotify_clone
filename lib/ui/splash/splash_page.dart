import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domain/app_color.dart';
import 'package:spotify_clone/domain/app_routes.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.intro_page);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Center(
        child: SvgPicture.asset(
          'assets/logo/Logo.svg',
          width: 80,
          height: 80,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
