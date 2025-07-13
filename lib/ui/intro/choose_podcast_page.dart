import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_color.dart';
import 'package:spotify_clone/domain/app_routes.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_circular__img_bg.dart';
import 'package:spotify_clone/ui/custom_widgets/my_rounded_img_card.dart';

import '../custom_widgets/my_custom_rounded_btn.dart';

class ChoosePodcastPage extends StatelessWidget {
  List<List<Map<String, dynamic>>> mPodcast = [
    [
      {"imgPath": "assets/images/s1.jpg", "name": "njma"},
      {"imgPath": "assets/images/s2.jpg", "name": "rustam"},
      {"imgPath": "assets/images/s3.jpg", "name": "More in true crime"},
    ],
    [
      {"imgPath": "assets/images/s4.jpg", "name": "njma"},
      {"imgPath": "assets/images/s5.jpg", "name": "gangi"},
      {"imgPath": "assets/images/s6.jpg", "name": "More in comedy"},
    ],
    [
      {"imgPath": "assets/images/s7.jpg", "name": "raju"},
      {"imgPath": "assets/images/s8.jpg", "name": "thalaphathy"},
      {"imgPath": "assets/images/s9.jpg", "name": "More in Stories"},
    ],
    [
      {"imgPath": "assets/images/s11.jpg", "name": "Tanu"},
      {"imgPath": "assets/images/s3.jpg", "name": "hamiya"},
      {"imgPath": "assets/images/s4.jpg", "name": "More in relationship"},
    ],
    [
      {"imgPath": "assets/images/s5.jpg", "name": "gangi"},
      {"imgPath": "assets/images/s6.jpg", "name": "aaliya"},
      {"imgPath": "assets/images/s1.jpg", "name": "More in southmovie "},
    ],
    [
      {"imgPath": "assets/images/s2.jpg", "name": "rustam"},
      {"imgPath": "assets/images/s3.jpg", "name": "hamiya"},
      {"imgPath": "assets/images/s4.jpg", "name": "More in bollywood"},
    ],
    [
      {"imgPath": "assets/images/s5.jpg", "name": "gangi"},
      {"imgPath": "assets/images/s6.jpg", "name": "aaliya"},
      {"imgPath": "assets/images/s7.jpg", "name": "More in hollywood"},
    ],
    [
      {"imgPath": "assets/images/s8.jpg", "name": "thalaphathy"},
      {"imgPath": "assets/images/s9.jpg", "name": "simran"},
      {"imgPath": "assets/images/s11.jpg", "name": "More in Tollywood"},
    ],
    [
      {"imgPath": "assets/images/s3.jpg", "name": "hamiya"},
      {"imgPath": "assets/images/s4.jpg", "name": "njma"},
      {"imgPath": "assets/images/s5.jpg", "name": "More in Bhujapuri"},
    ],
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
                "Now Choose some Podcast",
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
                    ListView.builder(
                      itemCount: mPodcast.length,
                      itemBuilder: (_, index) {
                        return Container(
                          padding: EdgeInsets.all(5.5),
                          height: 150,
                          child: ListView.builder(
                            shrinkWrap: true, // esse page shrink hoga
                            scrollDirection: Axis.horizontal,
                            itemCount: mPodcast[index].length,
                            itemBuilder: (_, childIndex) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Column(
                                  children: [
                                    childIndex == 2
                                        ? Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 11,
                                          ),
                                          width: 120,
                                          height: 120,
                                          child: Text(
                                            mPodcast[index][childIndex]['name'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              11,
                                            ),
                                            color:
                                                Colors.primaries[Random()
                                                    .nextInt(
                                                      Colors.primaries.length,
                                                    )],
                                          ),
                                        )
                                        : MyRoundedImgCard(
                                          mWidth: 120,
                                          mHeight: 120,
                                          imgPath:
                                              mPodcast[index][childIndex]['imgPath'],
                                        ),
                                    const SizedBox(height: 5),
                                    // spacing between image and text
                                    Text(
                                      mPodcast[index][childIndex]['name'],
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
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,

                      child: Container(
                        width: double.infinity,
                        height: 180,

                        child: MyCustomRoundedBtn(
                          mWidth: 100,
                          mHeight: 50,
                          text: "Done",
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.dashboard_page,
                            );
                          },
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            // gradient ki help ye shadow vala part mange krte h
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
