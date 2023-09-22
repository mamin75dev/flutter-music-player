import 'package:get/get.dart';
import 'package:music_player/utils/permissions_handler.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();

  @override
  void onInit() {
    super.onInit();
    PermissionHandler.checkPermission();
  }

  // Future<List<SongModel>> getMusicsFromDevice() async {
  // return await audioQuery.querySongs(
  //   ignoreCase: true,
  //   orderType: OrderType.ASC_OR_SMALLER,
  //   sortType: null,
  //   uriType: UriType.EXTERNAL,
  // );
  // }
}
