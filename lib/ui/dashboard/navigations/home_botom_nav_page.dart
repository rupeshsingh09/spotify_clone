import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domain/app_color.dart';
import 'package:spotify_clone/domain/ui_helper.dart';

class HomeBotomNavPage extends StatefulWidget {
  @override
  State<HomeBotomNavPage> createState() => _HomeBotomNavPageState();
}

class _HomeBotomNavPageState extends State<HomeBotomNavPage> {
  List<Map<String, dynamic>> mRecentlyPlayedList = [
    {"imgPath": "assets/images/s1.jpg", "name": "Raman"},
    {"imgPath": "assets/images/s2.jpg", "name": "Lana Del Rey"},
    {"imgPath": "assets/images/s3.jpg", "name": "Marvin Gaye"},
    {"imgPath": "assets/images/s4.jpg", "name": "Indio Pop"},
  ];

  List<Map<String, dynamic>> mReviewList = [
    {"imgPath": "assets/images/top_song.jpg", "name": "Your top sings in 2025"},
    {"imgPath": "assets/images/ale.jpg", "name": "Your Artist Revealead"},
  ];

  List<Map<String, dynamic>> mEditorPicksList = [
    {
      "imgPath": "assets/images/editor_1.png",
      "name": 'Ed Sheeran, Big Sean,\n Juice WRLD, Post Malone',
    },
    {
      "imgPath": "assets/images/editor_2.png",
      "name": "Mitski, Tame Impala,\nGlass Animals, Charli XCX",
    },
    {"imgPath": "assets/images/editor_3.png", "name": " "},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              recentlyPlayedUI(),
              mSpacer(),
              recentlyPlayedListUI(),
              mSpacer(mHeight: 15),
              reviewUI(),
              mSpacer(mHeight: 15),
              reviewListUI(),
              mSpacer(mHeight: 10),
              editPickerUI(),
            ],
          ),
        ),
      ),
    );
  }

  Widget recentlyPlayedUI() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Row(
            children: [
              Text(
                "Recently played",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Image.asset('assets/png/Vector.png'),
              mSpacer(mWidth: 10),
              Image.asset('assets/png/orientation lock.png'),
              mSpacer(mWidth: 10),
              Image.asset('assets/png/Settings.png'),
            ],
          ),
        ),
      ],
    );
  }

  Widget recentlyPlayedListUI() {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: mRecentlyPlayedList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Column(
              children: [
                Image.asset(
                  mRecentlyPlayedList[index]['imgPath'],
                  width: 100,
                  height: 100,
                ),
                mSpacer(),
                Text(
                  mRecentlyPlayedList[index]['name'],
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget reviewUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        children: [
          Image.asset("assets/images/review.png", width: 59, height: 59),
          mSpacer(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#SPOTIFYWRAPPED",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
                Text(
                  "Your 2025 in review",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // we make another fun. i.e. ' reviewListUi '
  Widget reviewListUI() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mReviewList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  mReviewList[index]['imgPath'],
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
                mSpacer(mHeight: 20),
                Text(
                  mReviewList[index]['name'],
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // we make another fun. i.e. 'editPickerUi '
  Widget editPickerUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Text(
            "Editor Picks",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mEditorPicksList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  children: [
                    // jo upar list banye h usko call krnege vha
                    Image.asset(
                      mEditorPicksList[index]['imgPath'],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    mSpacer(),
                    Text(
                      mEditorPicksList[index]['name'],
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
