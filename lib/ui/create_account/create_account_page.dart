import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domain/app_color.dart';
import 'package:spotify_clone/domain/app_routes.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_custom_rounded_btn.dart';
import 'package:spotify_clone/ui/intro/choose_artist_page.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  int selectedIndex = 0;
  List<Widget> allPages = [];

  bool isPP1Selected = false;
  bool isPP2Selected = false;

  @override
  void initState() {
    super.initState();
    allPages = [StepOneUI(), StepTwoUI(), StepThreeUI(), StepFourUI()];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        centerTitle: true,
        title: Text(
          "Create an account",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: InkWell(
          onTap: () {
            if (selectedIndex > 0) {
              selectedIndex--;
              setState(() {});
            } else {
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),

            child: SvgPicture.asset(
              'assets/logo/left.svg',
              color: Colors.white,
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            allPages[selectedIndex],
            mSpacer(mHeight: 20),

            MyCustomRoundedBtn(
              mWidth: selectedIndex < 3 ? 100 : 150,
              text: selectedIndex < 3 ? "Next" : "Create an account",
              onTap: () {
                if (selectedIndex < 3) {
                  selectedIndex++;
                  setState(() {});
                } else {
                  Navigator.pushNamed(context, AppRoutes.choose_artist_page);
                }
              },
            ),
            mSpacer(),
          ],
        ),
      ),
    );
  }

  Widget StepOneUI() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "What's your email ? ",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      mSpacer(),
      TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: getCreateAccTextFieldDecoration(),
      ),
      mSpacer(mHeight: 7),
      Text(
        "You will need to conform this later",
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ],
  );

  Widget StepTwoUI() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Create a password",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      mSpacer(),
      TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: getCreateAccTextFieldDecoration(),
      ),
      mSpacer(mHeight: 7),
      Text(
        "Use atleast 8 characters",
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ],
  );

  Widget StepThreeUI() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "What's your Gender ? ",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      mSpacer(mHeight: 20),
      Wrap(
        runAlignment: WrapAlignment.spaceEvenly,
        runSpacing: 21,
        spacing: 21,
        children: [
          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 40,
            isOutlined: true,
            textColor: Colors.white,
            text: "Male",
            bgColor: AppColor.primaryColor,
            onTap: () {},
          ),
          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 40,
            isOutlined: true,
            textColor: Colors.white,
            text: "Female",
            bgColor: AppColor.primaryColor,
            onTap: () {},
          ),

          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 40,
            isOutlined: true,
            textColor: Colors.white,
            text: "Other",
            bgColor: AppColor.primaryColor,
            onTap: () {},
          ),

          MyCustomRoundedBtn(
            mWidth: 180,
            mHeight: 50,
            isOutlined: true,
            textColor: Colors.white,
            text: "Not prefer to say",
            bgColor: AppColor.primaryColor,
            onTap: () {},
          ),
        ],
      ),
    ],
  );

  Widget StepFourUI() => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What's your name ? ",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        mSpacer(),
        TextField(
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: getCreateAccTextFieldDecoration(),
        ),
        mSpacer(mHeight: 7),
        Text(
          "This appear on your spotify profile",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        mSpacer(mHeight: 20),
        Divider(color: AppColor.greyColor),
        Text(
          "By tapping on “Create account”, you agree to the spotify Terms of Use.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        mSpacer(),
        Text(
          "Terms of Use.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        mSpacer(),
        Text(
          "To learn more about how Spotify collect, uses, shares and protects your personal data, Please see the Spotify Privacy Policy.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        mSpacer(),
        Text(
          "Privacy Policy",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        mSpacer(),
        RadioListTile.adaptive(
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(
            "Please send me news and offers from Spotify",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          value: isPP1Selected,
          groupValue: false,
          onChanged: (value) {
            isPP1Selected = value!;
            setState(() {});
          },
        ),
        RadioListTile.adaptive(
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(
            "Share my registration data with Spotify’s content providers for marketing purposes.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          value: isPP2Selected,
          groupValue: false,
          onChanged: (value) {
            isPP2Selected = value!;
            setState(() {});
          },
        ),
      ],
    ),
  );
}
