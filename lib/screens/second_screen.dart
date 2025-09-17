import 'package:beatify/screens/login_screen.dart';
import 'package:beatify/widgets/animated_shadow_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  final PageController controller = PageController();

  final List<String> images = [
    'assets/images/sad.png',
    'assets/images/happy.png',
  ];

  final List<String> text = [
    "Lost in your emotions??",
    "Every emotion has a sound. Find yours.",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          controller: controller,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.fill,
                ),
              ),
              child: SafeArea(
                child: Stack(
                  children: [
                    // Text
                    Positioned(
                      left: 20,
                      top: MediaQuery.of(context).size.height * 0.55,
                      child: Text(
                        text[index],
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 8,
                              color: Colors.black54,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Button on last page
                    if (index == images.length - 1)
                      Positioned(
                        left: 20,
                        top: MediaQuery.of(context).size.height * 0.61,
                        child: AnimatedShadowButton(
                          text: 'Lets Start',
                          action: () {
                            Get.to(() => LoginScreen());
                          },
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
