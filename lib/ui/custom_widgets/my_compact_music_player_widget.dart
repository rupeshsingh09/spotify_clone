import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:palette_generator/palette_generator.dart';

class MyCompactMusicPlayerWidget extends StatefulWidget {
  String songTitle;
  String albumTitle;
  String thumbnailPath;
  bool isBluetooth;
  String BlutoothName;
  double mHeight;
  Color bgColor;

  MyCompactMusicPlayerWidget({
    required this.albumTitle,
    required this.songTitle,
    required this.thumbnailPath,
    this.isBluetooth = false,
    this.BlutoothName = "",
    this.mHeight = 65,
    required this.bgColor,
  });

  @override
  State<MyCompactMusicPlayerWidget> createState() =>
      _MyCompactMusicPlayerWidgetState();
}

class _MyCompactMusicPlayerWidgetState
    extends State<MyCompactMusicPlayerWidget> {
  PaletteGenerator? paletteGenerator;
  @override
  void initState() {
    super.initState();
    initializeColorPalette();
  }

  initializeColorPalette() async {
    paletteGenerator = await getColorPalette(widget.thumbnailPath);
  }

  Widget build(BuildContext context) {
    return Container(
      height: widget.mHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),

        color:
            paletteGenerator != null
                ? paletteGenerator!.dominantColor?.color ?? widget.bgColor
                : widget.bgColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 5),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: DecorationImage(
                      image: AssetImage(widget.thumbnailPath),
                    ),
                  ),
                ),
                mSpacer(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.songTitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            " - ${widget.albumTitle}",
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                      widget.isBluetooth
                          ? Row(
                            children: [
                              Icon(Icons.bluetooth, color: Colors.green),
                              Text(
                                widget.BlutoothName,
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          )
                          : Container(),
                    ],
                  ),
                ),
                Icon(
                  widget.isBluetooth ? Icons.bluetooth : Icons.wifi,
                  color: Colors.white,
                ),
                Icon(Icons.pause, color: Colors.white),
              ],
            ),
            LinearProgressIndicator(
              value: 0.4,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              backgroundColor: Colors.white.withOpacity(0.3),
              color: Colors.white,
              borderRadius: BorderRadius.circular(11),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getDominantColor() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(widget.thumbnailPath),
    );
    setState(() {});
  }
}
