import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:smit_smit_media_player/common_widget/neumorphic_circle.dart';
import 'package:smit_smit_media_player/common_widget/neumorphic_progress.dart';
import 'package:smit_smit_media_player/presention/media/media_controller.dart';
import 'package:styled_widget/styled_widget.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaController mediaController = Get.put(MediaController());

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
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      loadingBuilder: (context, child, loadingProgress) =>
                          const Center(child: CircularProgressIndicator()),
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
                  mediaController.media.value.snippet.value.channelTitle.value,
                  textAlign: TextAlign.center,
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
              child: Container(
                height: 35,
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Feat. Some Band',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    inherit: false,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Gap(20),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 15,
                    alignment: Alignment.topLeft,
                    child: Text(
                      '1:17',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        inherit: false,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: NeumorphicProgressView(
                    progress: 0.5,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 15,
                    alignment: Alignment.topRight,
                    child: Text(
                      '2:46',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        inherit: false,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
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
                      onTap: () {
                        // Handle forward action here
                      },
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
