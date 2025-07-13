import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domain/app_color.dart';
import 'package:spotify_clone/domain/app_routes.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_custom_rounded_btn.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset('assets/images/front_background.png'),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.blackColor.withOpacity(0.3),
                    AppColor.blackColor,
                  ],
                ),
              ),
            ),

            bottomLoginUI(context),
          ],
        ),
      ),
    );
  }

  Widget bottomLoginUI(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.only(bottom: 50),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/logo/Logo.svg", width: 50, height: 50),
        mSpacer(),
        Text(
          "Millions of Songs.\n Free on Spotify",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
        MyCustomRoundedBtn(
          text: "Sign up free",
          bgColor: AppColor.primaryColor,
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.create_account_page);
          },
        ),
        mSpacer(),

        MyCustomRoundedBtn(
          mIconPath: "assets/logo/google.svg",
          text: "Continue with google",
          bgColor: AppColor.greyColor,
          textColor: Colors.white,
          onTap: () {},
        ),
        mSpacer(),

        MyCustomRoundedBtn(
          mIconPath: "assets/logo/facebook.svg",
          text: "Continue with facebook",
          bgColor: AppColor.greyColor,
          textColor: Colors.white,
          onTap: () {},
        ),
        mSpacer(),

        MyCustomRoundedBtn(
          text: "Continue with apple",
          mIconPath: "assets/logo/apple.svg",
          bgColor: AppColor.greyColor,
          onTap: () {},
        ),

        TextButton(
          onPressed: () {},
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
