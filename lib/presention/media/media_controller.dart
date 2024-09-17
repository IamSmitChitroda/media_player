import 'package:Media_Player/presention/media_list/media_list_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import '/model/media_model.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MediaController extends GetxController {
  final MediaListController _mediaListController =
      Get.find<MediaListController>();

  final AudioPlayer audioPlayer = AudioPlayer();
  final YoutubeExplode _youtubeExplode = YoutubeExplode();
  var isPlaying = false.obs;
  var isLoading = true.obs;
  String? audioUrl;

  int _currentSongIndex = Get.arguments as int;
  Rx<Media?> media = Rx<Media?>(null);
  RxDouble progress = 0.0.obs;
  RxDouble currentPosition = 0.0.obs;
  Rx<Duration> totalDuration = Duration.zero.obs;

  @override
  Future<void> onInit() async {
    media.value = _mediaListController.medialList[_currentSongIndex];
    super.onInit();

    await playYouTubeAudio(media.value!.id.value.videoId.value);
    audioPlayer.positionStream.listen((position) {
      if (totalDuration.value.inMilliseconds > 0) {
        currentPosition.value = position.inMilliseconds.toDouble();
        progress.value =
            position.inMilliseconds / totalDuration.value.inMilliseconds;
      }
    });

    audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        totalDuration(duration);
      }
    });
  }

  Future<void> playYouTubeAudio(String videoId) async {
    try {
      isLoading.value = true;
      var manifest =
          await _youtubeExplode.videos.streamsClient.getManifest(videoId);
      var audioStreamInfo = manifest.audioOnly.withHighestBitrate();

      audioUrl = audioStreamInfo.url.toString();
      await audioPlayer.setUrl(audioUrl!);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  void seekTo(double value) {
    if (totalDuration.value != Duration.zero) {
      final newPosition = totalDuration.value * value;
      audioPlayer.seek(newPosition);
    }
  }

  void pauseAudio() {
    audioPlayer.pause();
    isPlaying.value = false;
  }

  void resumeAudio() {
    audioPlayer.play();
    isPlaying.value = true;
  }

  void stopAudio() {
    audioPlayer.stop();
    isPlaying.value = false;
  }

  Future<void> forwardAudio() async {
    isLoading(true);
    if (_currentSongIndex != (_mediaListController.medialList.length - 1)) {
      pauseAudio();
      _currentSongIndex++;
      media.value = _mediaListController.medialList[_currentSongIndex];
      await playYouTubeAudio(media.value!.id.value.videoId.value);
    } else {
      IconSnackBar.show(
        Get.context!,
        label: "Forward Failed",
        direction: DismissDirection.up,
        snackBarType: SnackBarType.fail,
      );
    }
    isLoading(false);
  }

  Future<void> backwardAudio() async {
    isLoading(true);
    if (_currentSongIndex != 0) {
      pauseAudio();
      _currentSongIndex--;
      media.value = _mediaListController.medialList[_currentSongIndex];
      await playYouTubeAudio(media.value!.id.value.videoId.value);
    } else {
      IconSnackBar.show(
        Get.context!,
        label: "Backward Failed",
        direction: DismissDirection.up,
        snackBarType: SnackBarType.fail,
      );

      // Get.snackbar("Backward Failed", "Try Again !!!");
    }
    isLoading(false);
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    _youtubeExplode.close();
    super.onClose();
  }
}
