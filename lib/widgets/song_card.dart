import 'package:beatify/widgets/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongCard extends StatelessWidget {
  final String image;
  final String song;
  const SongCard({super.key, required this.image, required this.song});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: Image.asset(image),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: Material(
              color: Colors.black,
              shape: const CircleBorder(),
              child: IconButton(
                onPressed: () {
                  Get.dialog(AudioPractice(image: image, songUrl: song));
                },
                icon: Icon(Icons.play_arrow, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
