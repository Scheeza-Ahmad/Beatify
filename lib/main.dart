import 'package:beatify/models/playlist_model.dart';
import 'package:beatify/screens/profile_screen.dart';
import 'package:beatify/widgets/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ProfileScreen(),
      ),
      ),
    );
  }
}
