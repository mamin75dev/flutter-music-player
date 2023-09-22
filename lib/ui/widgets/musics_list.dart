import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controllers/player_controller.dart';
import 'package:music_player/ui/resources/styles/text_style.dart';
import 'package:music_player/ui/widgets/music_item.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicsList extends StatefulWidget {
  const MusicsList({super.key});

  @override
  State<MusicsList> createState() => _MusicsListState();
}

class _MusicsListState extends State<MusicsList> {
  var controller = Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL,
      ),
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              "No songs available!!",
              style: titleStyle(),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return MusicItem(
                id: snapshot.data![index].id,
                title: snapshot.data![index].title,
                subTitle: "${snapshot.data![index].artist}",
              );
            },
          );
        }
      },
    );
  }
}
