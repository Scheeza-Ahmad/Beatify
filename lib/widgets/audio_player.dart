import 'package:beatify/widgets/animated_shadow_button.dart';
import 'package:beatify/widgets/neon_card.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPractice extends StatefulWidget {
  final String image;
  final String songUrl;

  const AudioPractice({super.key, required this.image, required this.songUrl});

  @override
  State<AudioPractice> createState() => _AudioPracticeState();
}

class _AudioPracticeState extends State<AudioPractice> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    _setURL();
  }

  Future<void> _setURL() async {
    await player.setAsset(widget.songUrl);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      child: NeonCard(
        intensity: 0.5,
        glowSpread: 0.8,
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.image,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => player.play(),
                    icon: const Icon(Icons.play_arrow, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () => player.pause(),
                    icon: const Icon(Icons.pause, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () => player.stop(),
                    icon: const Icon(Icons.stop, color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  AnimatedShadowButton(
                    text: '1x',
                    action: () => player.setSpeed(1.0),
                  ),
                  SizedBox(width: 8),
                  AnimatedShadowButton(
                    text: '1.5x',
                    action: () => player.setSpeed(1.5),
                  ),
                  SizedBox(width: 8),
                  AnimatedShadowButton(
                    text: '2x',
                    action: () => player.setSpeed(2.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
