import 'package:beatify/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:beatify/models/playlist_model.dart';
import 'package:beatify/widgets/audio_player.dart';
import 'package:get/get.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({super.key});

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.black, Color(0xFF6A1B9A)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 40, 15, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SearchBarr(
                          hint: 'Search your liked song here',
                          control: SearchController(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ), // spacing between search and button
                    InkWell(
                      onTap: () {
                        setState(() {
                          playlist.sort(
                            (a, b) => a.arrNames.compareTo(b.arrNames),
                          );
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Text(
                            'Sort',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Liked Songs',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Songs: ${playlist.length}',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: playlist.length,
                  itemBuilder: (context, index) {
                    final item = playlist[index];

                    return ListTile(
                      leading: Image.asset(
                        item.images,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),

                      title: Text(
                        item.arrNames,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        item.artist,
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Get.dialog(
                            AudioPractice(
                              image: item.images,
                              songUrl: item.song,
                            ),
                          );
                        },
                        icon: Icon(Icons.play_arrow, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
