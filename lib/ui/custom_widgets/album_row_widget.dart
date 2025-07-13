import 'dart:math';
import 'package:flutter/material.dart';

class AlbumRowWidget extends StatelessWidget {
  String thumbnailPath;
  String albumnailName;

  AlbumRowWidget({required this.albumnailName, required this.thumbnailPath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5 - 16,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:
              Colors.primaries[Random().nextInt(Colors.primaries.length - 1)],
        ),

        child: Stack(
          children: [
            Positioned(
              right: -70,
              bottom: -30,
              child: Transform.rotate(
                angle: 45 * pi / 180,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 11,
                      ),
                    ],
                    image: DecorationImage(image: AssetImage(thumbnailPath)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 11,
              left: 11,
              child: Text(
                albumnailName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
