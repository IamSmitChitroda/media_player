import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smit_smit_media_player/model/media_model.dart';
import 'package:smit_smit_media_player/presention/media/media_screen.dart';
import 'package:smit_smit_media_player/presention/media_list/media_list_controller.dart';

class MusicListView extends StatelessWidget {
  MusicListView({super.key});

  final MediaListController controller = Get.put(MediaListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 36, 40),
      appBar: AppBar(
        title: const Text(
          'Music Library',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(
        () {
          return Stack(
            children: [
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: controller.medialList.length,
                itemBuilder: (context, index) {
                  Media media = controller.medialList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(const MediaScreen(), arguments: media);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 33, 36, 40),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            offset: const Offset(-4, -4),
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            offset: const Offset(4, 4),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            media.snippet.value.thumbnails.value.high.value.url
                                .value,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.stop_screen_share,
                            ),
                          ),
                        ),
                        title: Text(
                          media.snippet.value.title.value,
                          // music['title']!,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          media.snippet.value.description.value,
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.7)),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
              if (controller.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          );
        },
      ),
    );
  }
}
