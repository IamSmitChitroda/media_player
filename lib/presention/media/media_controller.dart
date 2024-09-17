import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logger/logger.dart';
import '/model/media_model.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MediaController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  final YoutubeExplode _youtubeExplode = YoutubeExplode();
  var isPlaying = false.obs;
  var isLoading = true.obs;
  String? audioUrl;

  Rx<Media> media = (Get.arguments as Media).obs;
  RxDouble progress = 0.0.obs;
  RxDouble currentPosition = 0.0.obs;
  Rx<Duration> totalDuration = Duration.zero.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    await playYouTubeAudio(media.value.id.value.videoId.value);

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
      // _youtubeExplode.
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

  @override
  void onClose() {
    audioPlayer.dispose();
    _youtubeExplode.close();
    super.onClose();
  }
}
