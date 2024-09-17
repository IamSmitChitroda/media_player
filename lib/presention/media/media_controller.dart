import 'dart:developer';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import '/model/media_model.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MediaController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  final YoutubeExplode _youtubeExplode = YoutubeExplode();
  var isPlaying = false.obs;
  var isLoading = true.obs;
  String? audioUrl;

  @override
  void onClose() {
    audioPlayer.dispose();
    _youtubeExplode.close();
    super.onClose();
  }

  Rx<Media> media = (Get.arguments as Media).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await playYouTubeAudio(media.value.id.value.videoId.value);
  }

  Future<void> playYouTubeAudio(String videoId) async {
    try {
      isLoading.value = true;

      var manifest =
          await _youtubeExplode.videos.streamsClient.getManifest(videoId);
      var audioStreamInfo = manifest.audioOnly.withHighestBitrate();

      audioUrl = audioStreamInfo.url.toString();
      await audioPlayer.setUrl(audioUrl!);
      audioPlayer.play();
      isPlaying.value = true;
      isLoading.value = false;
    } catch (e) {
      // print('Error: $e');
      isLoading.value = false;
    }
  }

  void pauseAudio() {
    try {
      audioPlayer.pause();
      isPlaying.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  void resumeAudio() {
    audioPlayer.play();
    isPlaying.value = true;
  }

  void stopAudio() {
    audioPlayer.stop();
    isPlaying.value = false;
  }
}
