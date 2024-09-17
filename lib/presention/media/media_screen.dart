import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../common_widget/neumorphic_circle.dart';
import 'media_controller.dart';

class MediaScreen extends StatelessWidget {
  MediaScreen({super.key});

  final MediaController mediaController = Get.put(MediaController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 36, 40),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(46, 51, 55, 1),
              Color.fromARGB(255, 33, 36, 40),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(80),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: NeumorphicCircleView(
                    height: 50,
                    onPressed: () {
                      mediaController.stopAudio();
                      Get.back();
                    },
                    width: 50,
                    child: const Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 45,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'PLAYING NOW',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        inherit: false,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: NeumorphicCircleView(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.queue_music_rounded,
                      size: 28,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            const Gap(40),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: NeumorphicCircleView(
                    borderWidth: 24,
                    borderColor: const Color.fromARGB(255, 41, 41, 41),
                    height: 300,
                    width: 300,
                    child: Image.network(
                      mediaController.media.value.snippet.value.thumbnails.value
                          .high.value.url.value,

                      // loadingBuilder: (context, child, loadingProgress) =>
                      //     const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(40),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 45,
                alignment: Alignment.bottomCenter,
                child: Text(
                  mediaController.media.value.snippet.value.title.value
                      .split('|')[0],
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.65),
                    inherit: false,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Obx(
                () {
                  return Container(
                    height: 35,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      mediaController
                          .media.value.snippet.value.channelTitle.value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        inherit: false,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Gap(20),
            Obx(
              () {
                return NeumorphicSlider(
                  value: mediaController.progress.value,
                  min: 0,
                  max: 1,
                  onChanged: (value) {
                    mediaController.seekTo(value);
                  },
                  currentPosition: Duration(
                    milliseconds: mediaController.currentPosition.value.toInt(),
                  ),
                  totalDuration: mediaController.totalDuration.value,
                );
              },
            ),
            const Spacer(),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: NeumorphicCircleView(
                    height: 60,
                    width: 60,
                    child: GestureDetector(
                      onTap: () {
                        // Handle rewind action here
                      },
                      child: const Icon(
                        Icons.fast_rewind_rounded,
                        size: 28,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: NeumorphicCircleView(
                    height: 62,
                    width: 62,
                    color: const Color.fromRGBO(230, 59, 16, 1),
                    shape: NeumorphicShape.concave,
                    onPressed: () {
                      if (mediaController.isPlaying.value) {
                        mediaController.pauseAudio();
                      } else {
                        mediaController.resumeAudio();
                      }
                    },
                    child: Obx(
                      () {
                        return Icon(
                          mediaController.isPlaying.value
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          size: 30,
                          color: Colors.white,
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: NeumorphicCircleView(
                    height: 60,
                    width: 60,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.fast_forward_rounded,
                        size: 28,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ).padding(horizontal: 40),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}

class NeumorphicSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;
  final Duration currentPosition;
  final Duration totalDuration;

  NeumorphicSlider({
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    required this.currentPosition,
    required this.totalDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          _formatDuration(currentPosition),
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Slider(
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
            activeColor: Colors.deepOrange,
            inactiveColor: Colors.grey,
            thumbColor: Colors.deepOrange,
          ),
        ),
        Text(
          _formatDuration(totalDuration),
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
