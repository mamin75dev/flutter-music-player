import 'package:flutter/material.dart';
import 'package:music_player/ui/resources/styles/text_style.dart';

class MusicPlayerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MusicPlayerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Music Player", style: titleStyle()),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
