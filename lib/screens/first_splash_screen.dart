import 'package:beatify/screens/login_screen.dart';
import 'package:beatify/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstSplashScreen extends StatefulWidget {
  const FirstSplashScreen({super.key});

  @override
  State<FirstSplashScreen> createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Controller for fade animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // fade in/out

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    Future.delayed(const Duration(seconds: 4), () {
      Get.off(() => LoginScreen());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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

            // 🔹 Center Text with Fade Animation
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: GradientText(
                  text: 'Beatify',
                  fontSize: 50,
                  gradientColors: [
                    Color.fromARGB(255, 192, 76, 231),
                    Color.fromARGB(255, 142, 158, 248),
                    Color.fromARGB(255, 107, 230, 230),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
