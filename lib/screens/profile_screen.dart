import 'package:beatify/widgets/custom_flip_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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

            Center(child: CustomFlipCard()),
          ],
        ),
      ),
    );
  }
}
