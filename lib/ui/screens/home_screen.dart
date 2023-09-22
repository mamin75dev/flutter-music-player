import 'package:flutter/material.dart';
import 'package:music_player/ui/widgets/app_bar.dart';
import 'package:music_player/ui/widgets/musics_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MusicPlayerAppBar(),
      body: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0, vertical: 8.0),
        child: const MusicsList(),
      ),
    );
  }
}
