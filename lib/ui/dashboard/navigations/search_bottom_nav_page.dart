import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_color.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/album_row_widget.dart';

class SearchBottomNavPage extends StatelessWidget {
  List<Map<String, dynamic>> mTopGenreList = [
    {"imgPath": "assets/images/top1.jpg", "name": "Pop"},
    {"imgPath": "assets/images/top2.jpg", "name": "Indie"},
    {"imgPath": "assets/images/top3.jpg", "name": "Pop"},
    {"imgPath": "assets/images/top1.jpg", "name": "Indie"},
  ];

  List<Map<String, dynamic>> mPodcatList = [
    {"imgPath": "assets/images/top3.jpg", "name": "News and poloitics"},
    {"imgPath": "assets/images/top1.jpg", "name": "Comedy"},
    {"imgPath": "assets/images/top2.jpg", "name": "Bollyhood"},
    {"imgPath": "assets/images/top1.jpg", "name": "Hollyhood"},
  ];

  List<Map<String, dynamic>> mBrowseList = [
    {"imgPath": "assets/images/top2.jpg", "name": "2021 Wrapped"},
    {"imgPath": "assets/images/top1.jpg", "name": "Podcasts"},
    {"imgPath": "assets/images/top2.jpg", "name": "made for you"},
    {"imgPath": "assets/images/top1.jpg", "name": "charts"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        body: Column(
          children: [
            titleUI(),
            mSpacer(),
            searchBarUI(),
            mSpacer(),
            topGenresUI(),
            mSpacer(),
            poppularPodcasts(),
            mSpacer(),

            Expanded(child: browsAll()),
          ],
        ),
      ),
    );
  }

  Widget titleUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Search",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(Icons.camera_alt_outlined, size: 22, color: Colors.white),
          mSpacer(),
        ],
      ),
    );
  }

  Widget searchBarUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        child: TextField(
          cursorColor: AppColor.primaryColor,
          autofocus: false,
          decoration: InputDecoration(
            hintText: "     Artists, songs or podcasts ",
            hintStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            border: InputBorder.none,
            prefixIconConstraints: BoxConstraints(minWidth: 0, maxWidth: 0),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 7.0),
              child: Icon(Icons.search, size: 25),
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget topGenresUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Genres",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: mTopGenreList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return AlbumRowWidget(
                  thumbnailPath: mTopGenreList[index]["imgPath"],
                  albumnailName: mTopGenreList[index]["name"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget poppularPodcasts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Poppular Podcasts categeries",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: mPodcatList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return AlbumRowWidget(
                  thumbnailPath: mPodcatList[index]["imgPath"],
                  albumnailName: mPodcatList[index]["name"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget browsAll() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Browse all",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          mSpacer(),
          Expanded(
            child: GridView.builder(
              itemCount: mBrowseList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 10 / 5,
                mainAxisSpacing: 1,
                crossAxisSpacing: 5,
              ),
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) {
                return AlbumRowWidget(
                  thumbnailPath: mBrowseList[index]["imgPath"],
                  albumnailName: mBrowseList[index]["name"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
