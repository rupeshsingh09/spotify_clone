import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domain/app_color.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_library_liked.dart';
import 'package:spotify_clone/ui/custom_widgets/type_chipwidget.dart';

class LibraryBottomNavPage extends StatelessWidget {
  List<String> mTypes = ["Playlists", "Artists", "Album", "Podcasts & shows"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        body: Column(
          children: [
            mSpacer(),
            titleUI(),
            mSpacer(),
            typeChipUI(),
            mSpacer(mHeight: 10),
            recentlyPlayedUI(),
            mSpacer(mHeight: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MyLibraryLikedWidget(
                      mTitle: "Liked Songs",
                      mSubTitle: "Playlists | 58 songs",
                      mLeadingGradient: true,
                      mGradientColors: [
                        Color(0xff4A39EA),
                        Color(0xff868AE1),
                        Color(0xffB9D4DB),
                      ],
                    ),
                    mSpacer(mHeight: 5),
                    MyLibraryLikedWidget(
                      mTitle: "New Episodes",
                      mSubTitle: "Updated 2 days ago",
                      mSolidColor: Colors.purple,
                      mLeadingIcon: Icons.notifications_active,
                    ),

                    mSpacer(mHeight: 5),

                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Image.asset(
                                "assets/images/top2.jpg",
                                height: 60,
                                width: 60,
                              ),
                              title: Text("Lolo Zout"),
                              subtitle: Text("Artist"),
                              titleTextStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              subtitleTextStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            mSpacer(),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 23,
            backgroundImage: AssetImage("assets/images/avatar.jpg"),
          ),

          mSpacer(),
          Text(
            'Your Library',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(Icons.add, color: Colors.grey),
        ],
      ),
    );
  }

  Widget typeChipUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          itemCount: mTypes.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TypeChipWidget(typeName: mTypes[index]);
          },
        ),
      ),
    );
  }

  Widget recentlyPlayedUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Icon(
              Icons.compare_arrows_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
          mSpacer(mWidth: 3),
          Text(
            "Recently Played",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(Icons.menu, color: Colors.white),
        ],
      ),
    );
  }
}
