import 'package:beatify/widgets/animated_shadow_button.dart';
import 'package:beatify/widgets/gradient_text.dart';
import 'package:beatify/widgets/grid_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class NewDrops extends StatelessWidget {
  const NewDrops({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/background.png",
                fit: BoxFit.cover,
              ),
            ),

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

            // 🔹 Foreground Content
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  Row(
                    children: [
                      const Icon(Icons.workspace_premium, color: Colors.white),
                      const SizedBox(width: 6),
                      GradientText(
                        text: 'Premium',
                        fontSize: 18,
                        gradientColors: [
                          Color.fromARGB(255, 218, 157, 236),
                          Color.fromARGB(255, 168, 173, 211),
                          Color.fromARGB(255, 88, 241, 241),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Want to become a premium Member?',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '3 Months of Premium for PKR 0.00',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  AnimatedShadowButton(
                    text: 'Try 3 months for PKR 0',
                    action: () {
                      Get.snackbar(
                        'Premium',
                        'Congrats!! Now you are a Premium Member!!',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: const Color.fromARGB(255, 52, 26, 56),
                        colorText: Colors.white,
                        borderColor: Colors.black,
                        borderWidth: 2,
                        margin: const EdgeInsets.all(6),
                        borderRadius: 12,
                      );
                    },
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'New Drops',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  GridTileWidget(
                    text: 'Sahiba',
                    image: 'assets/images/sahiba.png',
                    song: 'assets/songs/sahiba.mp3',
                  ),
                  const SizedBox(height: 18),
                  GridTileWidget(
                    text: 'Saiyara',
                    image: 'assets/images/saiyara.png',
                    song: 'assets/songs/saiyara.mp3',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
