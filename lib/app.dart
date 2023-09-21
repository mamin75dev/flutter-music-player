import 'package:flutter/material.dart';
import 'package:music_player/ui/screens/home_screen.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
