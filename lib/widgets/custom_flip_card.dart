import 'package:beatify/models/user_model.dart';
import 'package:beatify/widgets/gradient_text.dart';
import 'package:beatify/widgets/neon_card.dart';
import 'package:beatify/widgets/profile_photo.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CustomFlipCard extends StatelessWidget {
  const CustomFlipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.FRONT,
      speed: 1000,
      onFlipDone: (status) {},
      front: Center(
        child: Container(
          width: 210,
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: NeonCard(
            intensity: 0.5,
            glowSpread: 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ProfileImagePicker(),
                const SizedBox(height: 10),

                Text(
                  UserModel.user?.name ?? 'Unknown User',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),

                const SizedBox(height: 8),

                // ✅ Email from UserModel
                Text(
                  UserModel.user?.email ?? 'No Email',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      back: Center(
        child: Container(
          width: 210,
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: NeonCard(
            intensity: 0.5,
            glowSpread: 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GradientText(
                  text: 'ENJOY THE MOMENT WITH BEATIFY',
                  fontSize: 20,
                  gradientColors: [
                    Color.fromARGB(255, 82, 4, 105),
                    Color.fromARGB(255, 4, 14, 71),
                    Color.fromARGB(255, 17, 24, 24),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
