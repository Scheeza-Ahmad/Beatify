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
  final TextEditingController _searchController = TextEditingController();
  String query = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                "assets/images/background.png",
                fit: BoxFit.cover,
              ),
            ),

            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      const Color(0xFF6A1B9A).withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),

                    // Greeting
                    Row(
                      children: [
                        GradientText(
                          text: 'Hello !! Good Evening ,',
                          fontSize: 20,
                          gradientColors: const [
                            Color.fromARGB(255, 218, 157, 236),
                            Color.fromARGB(255, 168, 173, 211),
                            Color.fromARGB(255, 88, 241, 241),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      'What you want to hear today??',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Recommendations Section
                    const Text(
                      'Top Recommendation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SongCard(
                            image: 'assets/images/saiyara.png',
                            song: 'assets/songs/saiyara.mp3',
                          ),
                          const SizedBox(width: 8),
                          SongCard(
                            image: 'assets/images/mannmera.png',
                            song: 'assets/songs/maanmera.mp3',
                          ),
                          const SizedBox(width: 8),
                          SongCard(
                            image: 'assets/images/zarasa.png',
                            song: 'assets/songs/zarasa.mp3',
                          ),
                          const SizedBox(width: 8),
                          SongCard(
                            image: 'assets/images/naina.png',
                            song: 'assets/songs/naina.mp3',
                          ),
                          const SizedBox(width: 8),
                          SongCard(
                            image: 'assets/images/pehlinazar.png',
                            song: 'assets/songs/pehlinazar.mp3',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Songs You May Like Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Songs You May Like ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const LikedScreen());
                          },
                          child: GradientText(
                            text: 'See All',
                            fontSize: 18,
                            gradientColors: const [
                              Color.fromARGB(255, 218, 157, 236),
                              Color.fromARGB(255, 168, 173, 211),
                              Color.fromARGB(255, 88, 241, 241),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // 🎵 Filtered Playlist lis
                    const SizedBox(height: 20),

                    const StackCardToggle(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        query = _searchController.text;
      });
    });
  }
}
