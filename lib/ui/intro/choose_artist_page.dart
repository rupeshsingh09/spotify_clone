import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_color.dart';
import 'package:spotify_clone/domain/app_routes.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_circular__img_bg.dart';
import 'package:spotify_clone/ui/intro/choose_podcast_page.dart';

import '../custom_widgets/my_custom_rounded_btn.dart';

class ChooseArtistPage extends StatefulWidget {
  @override
  State<ChooseArtistPage> createState() => _ChooseArtistPageState();
}

class _ChooseArtistPageState extends State<ChooseArtistPage> {
  List<int> selectedArtist = [];

  List<Map<String, dynamic>> mArtist = [
    {"imgPath": "assets/images/s1.jpg", "name": "njma"},
    {"imgPath": "assets/images/s2.jpg", "name": "rustam"},
    {"imgPath": "assets/images/s3.jpg", "name": "hamiya"},
    {"imgPath": "assets/images/s4.jpg", "name": "njma"},
    {"imgPath": "assets/images/s5.jpg", "name": "gangi"},
    {"imgPath": "assets/images/s6.jpg", "name": "aaliya"},
    {"imgPath": "assets/images/s7.jpg", "name": "raju"},
    {"imgPath": "assets/images/s8.jpg", "name": "thalaphathy"},
    {"imgPath": "assets/images/s9.jpg", "name": "simran"},
    {"imgPath": "assets/images/s11.jpg", "name": "Tanu"},
    {"imgPath": "assets/images/s3.jpg", "name": "hamiya"},
    {"imgPath": "assets/images/s4.jpg", "name": "njma"},
    {"imgPath": "assets/images/s5.jpg", "name": "gangi"},
    {"imgPath": "assets/images/s6.jpg", "name": "aaliya"},
    {"imgPath": "assets/images/s1.jpg", "name": "njma"},
    {"imgPath": "assets/images/s2.jpg", "name": "rustam"},
    {"imgPath": "assets/images/s3.jpg", "name": "hamiya"},
    {"imgPath": "assets/images/s4.jpg", "name": "njma"},
    {"imgPath": "assets/images/s5.jpg", "name": "gangi"},
    {"imgPath": "assets/images/s6.jpg", "name": "aaliya"},
    {"imgPath": "assets/images/s7.jpg", "name": "raju"},
    {"imgPath": "assets/images/s8.jpg", "name": "thalaphathy"},
    {"imgPath": "assets/images/s9.jpg", "name": "simran"},
    {"imgPath": "assets/images/s11.jpg", "name": "Tanu"},
    {"imgPath": "assets/images/s3.jpg", "name": "hamiya"},
    {"imgPath": "assets/images/s4.jpg", "name": "njma"},
    {"imgPath": "assets/images/s5.jpg", "name": "gangi"},
    {"imgPath": "assets/images/s6.jpg", "name": "aaliya"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // in copy
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mSpacer(mWidth: 300),
              Text(
                "Choose 3 or more artist you like",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              mSpacer(mHeight: 15),
              TextField(decoration: getSearchTextFieldDecoration()),

              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GridView.builder(
                        itemCount: mArtist.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 11,
                          crossAxisSpacing: 11,
                          childAspectRatio: 7 / 8,
                        ),
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              if (!selectedArtist.contains(index)) {
                                selectedArtist.add(index);
                                setState(() {});
                              } else {
                                selectedArtist.remove(index);
                                setState(() {});
                              }
                            },
                            child: Column(
                              children: [
                                MyCircularImgBg(
                                  imgPath: mArtist[index]['imgPath'],
                                  isSelected: selectedArtist.contains(index),
                                ),
                                const SizedBox(height: 5),
                                // spacing between image and text
                                Text(
                                  mArtist[index]['name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,

                      child: Container(
                        width: double.infinity,
                        height: 180,
                        child:
                            selectedArtist.length >= 3
                                ? Center(
                                  child: MyCustomRoundedBtn(
                                    mWidth: 100,
                                    mHeight: 50,
                                    text: "Next",
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.choose_podcast_page,
                                      );
                                    },
                                  ),
                                )
                                : Container(),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [0.05, 0.8],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
