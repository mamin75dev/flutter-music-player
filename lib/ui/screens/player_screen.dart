import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/controllers/player_controller.dart';
import 'package:music_player/ui/resources/styles/text_style.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayerScreen extends StatelessWidget {
  final List<SongModel> songs;

  const PlayerScreen({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => Expanded(
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 350,
                  height: 350,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: QueryArtworkWidget(
                    id: songs[controller.playIndex.value].id,
                    type: ArtworkType.AUDIO,
                    artworkWidth: double.infinity,
                    artworkHeight: double.infinity,
                    nullArtworkWidget: const Icon(Icons.music_note, size: 30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsetsDirectional.all(12.0),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Obx(
                  () => Column(
                    children: [
                      Text(
                        songs[controller.playIndex.value].title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: textStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${songs[controller.playIndex.value].artist}",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: textStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            controller.position.value,
                            style: textStyle(),
                          ),
                          Expanded(
                            child: Slider(
                              value: controller.value.value,
                              min: const Duration(seconds: 0).inSeconds.toDouble(),
                              max: controller.max.value,
                              onChanged: (value) {
                                controller.changeDurationToSeconds(value.toInt());
                                value = value;
                              },
                              thumbColor: Colors.black,
                              activeColor: Colors.black,
                              inactiveColor: Colors.black45,
                            ),
                          ),
                          Text(
                            controller.duration.value,
                            style: textStyle(),
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.playSong(
                                    songs[controller.playIndex.value - 1].uri, controller.playIndex.value - 1);
                              },
                              icon: const Icon(Icons.skip_previous_rounded, size: 30, color: Colors.black)),
                          Obx(
                            () => CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.black,
                              child: Transform.scale(
                                scale: 2.5,
                                child: IconButton(
                                  onPressed: () {
                                    if (controller.isPlaying.value) {
                                      controller.player.pause();
                                      controller.isPlaying(false);
                                    } else {
                                      controller.player.play();
                                      controller.isPlaying(true);
                                    }
                                  },
                                  icon: controller.isPlaying.value
                                      ? const Icon(Icons.pause_rounded, color: Colors.white70)
                                      : const Icon(Icons.play_arrow_rounded, color: Colors.white70),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.playSong(songs[controller.playIndex.value + 1].uri, controller.playIndex.value + 1);
                            },
                            icon: const Icon(Icons.skip_next_rounded, size: 30, color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
