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
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,

      shadowColor: Colors.black,
      child: SizedBox(
        width: 200,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color.fromARGB(255, 109, 71, 133), Colors.black],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
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

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                      ),
                      onPressed: () => player.setSpeed(1.0),
                      child: const Text(
                        '1x',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 6),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                      ),
                      onPressed: () => player.setSpeed(1.5),
                      child: const Text(
                        '1.5x',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 6),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                      ),

                      onPressed: () => player.setSpeed(2.0),
                      child: const Text(
                        '2x',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
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
