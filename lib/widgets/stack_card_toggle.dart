import 'dart:math';
import 'package:beatify/models/playlist_model.dart';
import 'package:beatify/widgets/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class StackCardToggle extends StatefulWidget {
  const StackCardToggle({super.key});

  @override
  State<StackCardToggle> createState() => _StackCardToggleState();
}

class _StackCardToggleState extends State<StackCardToggle> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: pi,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(playlist.length > 3 ? 3 : playlist.length, (
                    index,
                  ) {
                    final scaleFactor = isExpanded
                        ? 1.0
                        : 1 - (playlist.length - 1.0 * index) / 30;
                    final item = playlist[index];

                    return AnimatedAlign(
                      duration: const Duration(milliseconds: 1200),
                      alignment: Alignment.center,
                      curve: Curves.elasticInOut,
                      heightFactor: isExpanded ? 1.2 : 0.15,
                      child: AnimatedScale(
                        scale: scaleFactor,
                        duration: const Duration(milliseconds: 1200),
                        alignment: Alignment.center,
                        curve: Curves.elasticInOut,
                        child: Transform.rotate(
                          angle: pi,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ),
                              leading: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  item.images,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                item.arrNames,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              subtitle: Text(
                                item.artist,
                                style: Theme.of(context).textTheme.bodySmall,
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
                                icon: Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
          ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(isExpanded ? "Hide" : "Show All"),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isExpanded = !isExpanded;
      });
    });
    super.initState();
  }
}
