import 'package:Media_Player/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../common_widget/neumorphic_loading_view.dart';
import '../../model/media_model.dart';
import 'media_list_controller.dart';

class MediaListScreen extends StatelessWidget {
  MediaListScreen({super.key});

  final MediaListController controller = Get.put(MediaListController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 33, 36, 40),
        appBar: AppBar(
          title: const Text(
            'Music Library',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.sizeOf(context).width, 80),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
              child: TextField(
                controller: controller.searchController,
                onSubmitted: (value) {
                  controller.getSong(search: value);
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  hintText: "Search for music...",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Obx(
          () {
            return Stack(
              children: [
                Expanded(
                  child: LiquidPullToRefresh(
                    backgroundColor: const Color.fromARGB(255, 33, 36, 40),
                    color: Colors.grey.shade800,
                    onRefresh: controller.pullToRefresh,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      itemCount: controller.medialList.length,
                      itemBuilder: (context, index) {
                        Media media = controller.medialList[index];
                        return GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus!.unfocus();
                            Get.toNamed(Routes.media, arguments: index);
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
                                  media.snippet.value.thumbnails.value.high
                                      .value.url.value,
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
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                media.snippet.value.description.value,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7)),
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
                  ),
                ),
                if (controller.isLoading.value) const NeumorphicLoadingView(),
              ],
            );
          },
        ),
      ),
    );
  }
}
