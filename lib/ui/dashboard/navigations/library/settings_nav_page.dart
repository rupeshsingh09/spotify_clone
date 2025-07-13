import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/ui_helper.dart';

class SettingsNavPage extends StatelessWidget {
  // setting vale page m es list ko call krenge
  List<String> mSettingList = [
    "Account",
    "Data Saver",
    "Language",
    "Playback",
    "Device",
    "Car",
    "Storaage",
    "Audio abality"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          mSpacer(mHeight: 70),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white,),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Text("Settings", style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),),

              ],
            ),
          ),
          mSpacer(),

          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
              radius: 50,
            ),
            contentPadding:
            EdgeInsets
                .zero, // image ke padding ko zero krne k liye
            title: Text(
              "Rupesh",
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("View Profile",style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),),
            trailing: Icon(
              Icons.chevron_right_sharp,
              color: Colors.grey,
            ),
          ),
          Expanded(child: ListView.builder(
              itemCount: mSettingList.length,
              itemBuilder: (_,index) {
            return ListTile(
              contentPadding:
              EdgeInsets
                  .zero, // image ke padding ko zero krne k liye
              title: Text(mSettingList[index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right_sharp,
                color: Colors.grey,
              ),
            );
          }))

        ]
      ),

    );
  }
}
