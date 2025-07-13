import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spotify_clone/domain/app_color.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_compact_music_player_widget.dart';
import 'package:spotify_clone/ui/dashboard/navigations/home_botom_nav_page.dart';
import 'package:spotify_clone/ui/dashboard/navigations/library/my_profile_nav_page.dart';
import 'package:spotify_clone/ui/dashboard/navigations/library/settings_nav_page.dart';
import 'package:spotify_clone/ui/dashboard/navigations/library_bottom_nav_page.dart';
import 'package:spotify_clone/ui/dashboard/navigations/search_bottom_nav_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  PaletteGenerator? paletteGenerator;
  double currentvalue = 34;
  @override
  void initState() {
    super.initState();
    initializePaletteGenerator();
  }

  initializePaletteGenerator() async {
    paletteGenerator = await getColorPalette("assets/images/top1.jpg");
  }

  int selectedBottomindex = 0;

  List<Widget> mBottomNavPages = [
    HomeBotomNavPage(),
    SearchBottomNavPage(),
    SettingsNavPage(),
    MyProfileNavPage(profilePicPath: "assets/images/avatar.jpg"),
    LibraryBottomNavPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 65.0),
            child: mBottomNavPages[selectedBottomindex],
          ),
          Align(
            alignment: Alignment.bottomCenter,

            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.16, 1.0],
                          colors: [
                            paletteGenerator!.dominantColor!.color,
                            Colors.black,
                          ],
                        ),
                      ),

                      child: Stack(
                        children: [
                          Column(
                            children: [
                              mSpacer(mHeight: 34),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      child: Image.asset(
                                        "assets/images/Chevron left.png",
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Text(
                                      "1(Remastered)",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.more_horiz, color: Colors.white),
                                  ],
                                ),
                              ),
                              mSpacer(mHeight: 16),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(11),
                                  child: Image.asset("assets/images/top1.jpg"),
                                ),
                              ),
                              mSpacer(mHeight: 150),

                              // image ke niche music vale k liye
                              Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      "From Me to you- Recmanded to you ",
                                      maxLines: 1,
                                      softWrap: false,
                                    ),
                                    subtitle: Text("The Beatles"),
                                    titleTextStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.fade,
                                    ),
                                    subtitleTextStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    trailing: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 26,
                                    ),
                                  ),
                                  StatefulBuilder(
                                    builder: (_, ss) {
                                      return Slider(
                                        min: 0,
                                        max: 100,
                                        autofocus: true,
                                        value: currentvalue,
                                        onChanged: (value) {
                                          currentvalue = value;
                                          ss(() {});
                                        },
                                      );
                                    },
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "0.38",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "1.38",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset("assets/images/Shuffle.png"),
                                      Icon(
                                        Icons.skip_previous_sharp,
                                        color: Colors.white,
                                        size: 43,
                                      ),
                                      Icon(
                                        Icons.pause_circle_filled_sharp,
                                        color: Colors.white,
                                        size: 65,
                                      ),
                                      Icon(
                                        Icons.skip_next_sharp,
                                        color: Colors.white,
                                        size: 43,
                                      ),
                                      Image.asset(
                                        "assets/images/play.png",
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                  mSpacer(mHeight: 60),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.bluetooth,
                                        color: Colors.green,
                                        size: 14,
                                      ),
                                      Text(
                                        "BEATSPILL",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Spacer(),
                                      Image.asset("assets/images/Share.png"),
                                      mSpacer(mWidth: 80),
                                      Image.asset("assets/images/linning.png"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,

                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 16.0),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffD8672A),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(5),
                                ),
                              ),

                              child: Row(
                                children: [
                                  Text(
                                    "Lyrics",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 7,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "More",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Image.asset(
                                            "assets/images/mmore.png",
                                          ),
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                      ),
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: MyCompactMusicPlayerWidget(
                albumTitle: "The Neatles",
                songTitle: "From me to you",
                isBluetooth: true,
                thumbnailPath: "assets/images/top1.jpg",
                bgColor: Colors.green.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.blackColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedBottomindex,
        iconSize: 25,
        selectedLabelStyle: TextStyle(color: Colors.white),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.secondaryBlackColor,
        selectedItemColor: AppColor.whiteColor,
        onTap: (value) {
          selectedBottomindex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/png/Home filled.png',
              width: 25,
              height: 25,
              color: Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/png/Search.png',
              width: 25,
              height: 25,
              color: Colors.grey,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/png/Library small.png',
              width: 35,
              height: 35,
              color: Colors.grey,
            ),
            label: "Library",
          ),
        ],
      ),
    );
  }
}
