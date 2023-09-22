import 'package:flutter/material.dart';
import 'package:music_player/ui/resources/styles/text_style.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicItem extends StatelessWidget {
  final String title;

  final String subTitle;
  final int id;
  const MusicItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 6.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        tileColor: Colors.black12,
        title: Text(
          title,
          style: textStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: textStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.black54,
          ),
        ),
        leading: QueryArtworkWidget(
          id: id,
          type: ArtworkType.AUDIO,
          nullArtworkWidget: const Icon(Icons.music_note, size: 30),
        ),
        trailing: const Icon(Icons.play_arrow, size: 28),
      ),
    );
  }
}
