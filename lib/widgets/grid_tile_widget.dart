import 'package:beatify/widgets/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridTileWidget extends StatelessWidget {
  final String text;
  final String image;
  final String song;
  const GridTileWidget({
    super.key,
    required this.text,
    required this.image,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width,
        child: GridTile(
          footer: Container(
            color: theme.primaryColor.withOpacity(0.54),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Material(
                      color: Colors.black,
                      shape: const CircleBorder(),
                      child: IconButton(
                        onPressed: () {
                          Get.dialog(
                            AudioPractice(image: image, songUrl: song),
                          );
                        },
                        icon: Icon(Icons.play_arrow, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: Image.asset(image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
