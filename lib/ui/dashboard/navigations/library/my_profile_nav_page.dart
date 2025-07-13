import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spotify_clone/domain/app_color.dart';
import 'package:spotify_clone/domain/ui_helper.dart';

class MyProfileNavPage extends StatefulWidget {
  final String profilePicPath;
  MyProfileNavPage({required this.profilePicPath});

  @override
  State<MyProfileNavPage> createState() => _MyProfileNavPageState();
}

class _MyProfileNavPageState extends State<MyProfileNavPage> {
  // profile path denge tv se profile (image) se color udayega, palettegranted ki help se
  List<Map<String, dynamic>> mPlayLists = [
    {
      "title": " Shazam",
      "Likes": "7",
      "thumbGroup": [
        "assets/images/s3.jpg",
        "assets/images/s4.jpg",
        "assets/images/s1.jpg",
        "assets/images/s2.jpg",
      ],
    },
    {
      "title": "Ninja",
      "Likes": "10",
      "thumbGroup": [
        "assets/images/s3.jpg",
        "assets/images/s3.jpg",
        "assets/images/s5.jpg",
        "assets/images/s6.jpg",
      ],
    },
    {
      "title": "bappa",
      "Likes": "5",
      "thumbGroup": [
        "assets/images/s3.jpg",
        "assets/images/s7.jpg",
        "assets/images/s8.jpg",
        "assets/images/s9.jpg",
      ],
    },
  ];

  // es list m se image udayega ur grid banayega
  List<String> playlistThumbnailPath = [
    "assets/images/s3.jpg",
    "assets/images/s4.jpg",
    "assets/images/s1.jpg",
    "assets/images/s2.jpg",
  ];
  PaletteGenerator? paletteGenerator;

  @override
  void initState() {
    super.initState();
    initializePaletteGenerator();
  }

  void initializePaletteGenerator() async {
    paletteGenerator = await getColorPalette(
      widget.profilePicPath,
    ); // image ka oath h yh - widget.profilePicPath
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
      
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.34,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    paletteGenerator != null
                        ? HSLColor.fromColor(
                      paletteGenerator!.dominantColor!.color,
                    ).withLightness(0.34).toColor().withOpacity(0.85)
                        : Colors.blue.withOpacity(0.85),
                    Colors.transparent,
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(
                            "assets/images/Chevron left.png",
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Icon(Icons.more_horiz, color: Colors.white),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.profilePicPath),
                      radius: 50,
                    ),
                    mSpacer(mHeight: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Edit Profile"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.secondaryBlackColor,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    mSpacer(mHeight: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("23", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            Text("Playlists", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("58", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            Text("Followers", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("433", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            Text("Following", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    mSpacer(mHeight: 5),
                  ],
                ),
              ),
            ),




        // niche (playlist ) vale part k liye
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Playlists",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    mSpacer(),
      
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (_, index) {
                        return ListTile(
                          contentPadding:
                              EdgeInsets
                                  .zero, // image ke padding ko zero krne k liye
                          // 3-4 photo ko mila ke ek grid banayenge , but grid.builder ki jagah p wrap ko use kuiki reason niche h
                          leading: SizedBox(
                            width: 56,
                            height: 56,
                            child: Wrap(
                              // wrap krne se image jb bada rhega to automatic next line me bhej dega
                              children: // upar se image(thumbgroup " ko call kr rhe h
                                  ((mPlayLists[index]["thumbGroup"] as List?)
                                              ?.cast<String>() ??
                                          [])
                                      .map(
                                        (eachImg) => Container(
                                          width: 28,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(eachImg),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                          ),
      
                          title: Text(
                            // upar se text ko call kr rhe h
                            "${mPlayLists[index]["title"]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "${mPlayLists[index]["Likes"]}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Icon(
                            Icons.chevron_right_sharp,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
      
                    //  jo niche vala part h , show all playlist uske liye
                    ListTile(
                      contentPadding:
                          EdgeInsets
                              .zero, // image ke padding ko zero krne k liye
                      title: Text(
                        "See all playlists",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right_sharp,
                        color: Colors.grey,
                      ),
                    ),

                  ]
                ),
              ),
            ),
        ],
      ),
    ),
    );

  }
}