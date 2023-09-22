import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/utils/permissions_handler.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  final player = AudioPlayer();

  var playIndex = 0.obs;
  var isPlaying = false.obs;

  var duration = ''.obs;
  var position = ''.obs;

  var max = 0.0.obs;
  var value = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    PermissionHandler.checkPermission();
  }

  void updatePosition() {
    player.durationStream.listen((d) {
      duration.value = d.toString().split(".")[0];
      max.value = d!.inSeconds.toDouble();
    });
    player.positionStream.listen((p) {
      position.value = p.toString().split(".")[0];
      value.value = p.inSeconds.toDouble();
    });
  }

  changeDurationToSeconds(int seconds) {
    var duration = Duration(seconds: seconds);
    player.seek(duration);
  }

  void playSong(String? uri, index) {
    playIndex.value = index;
    try {
      player.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      player.play();
      isPlaying(true);
      updatePosition();
    } on Exception catch (e) {
      print("--------${e.toString()}");
    }
  }
}
