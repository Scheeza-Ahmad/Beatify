import 'package:beatify/screens/liked_screen.dart';
import 'package:beatify/widgets/gradient_text.dart';
import 'package:beatify/widgets/song_card.dart';
import 'package:beatify/widgets/stack_card_toggle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GradientText(
                        text: 'Hello !! Good Evening ,',
                        fontSize: 20,
                        gradientColors: [
                          Color.fromARGB(255, 218, 157, 236),
                          Color.fromARGB(255, 168, 173, 211),
                          Color.fromARGB(255, 88, 241, 241),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'What you want to hear today??',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Top Recommendation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SongCard(
                          image: 'assets/images/saiyara.png',
                          song: 'assets/songs/saiyara.mp3',
                        ),
                        SizedBox(width: 8),
                        SongCard(
                          image: 'assets/images/mannmera.png',
                          song: 'assets/songs/maanmera.mp3',
                        ),
                        SizedBox(width: 8),
                        SongCard(
                          image: 'assets/images/zarasa.png',
                          song: 'assets/songs/zarasa.mp3',
                        ),
                        SizedBox(width: 8),
                        SongCard(
                          image: 'assets/images/jhol.png',
                          song: 'assets/songs/jhol.mp3',
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Songs You May Like ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => LikedScreen());
                        },
                        child: GradientText(
                          text: 'See All',
                          fontSize: 18,
                          gradientColors: [
                            Color.fromARGB(255, 218, 157, 236),
                            Color.fromARGB(255, 168, 173, 211),
                            Color.fromARGB(255, 88, 241, 241),
                          ],
                        ),
                      ),
                    ],
                  ),
                  StackCardToggle(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
