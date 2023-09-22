import 'package:flutter/material.dart';
import 'package:music_player/ui/resources/styles/box_shadow.dart';
import 'package:music_player/ui/resources/styles/text_style.dart';

class MusicsList extends StatelessWidget {
  const MusicsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsetsDirectional.only(bottom: 6.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            tileColor: Colors.black12,
            title: Text(
              "Music Name",
              style: textStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Artist Name",
              style: textStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
            ),
            leading: const Icon(Icons.music_note, size: 30),
            trailing: const Icon(Icons.play_arrow, size: 28),
          ),
        );
      },
    );
  }
}
