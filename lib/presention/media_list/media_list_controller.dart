import 'dart:developer';

import 'package:get/get.dart';
import 'package:smit_smit_media_player/model/media_model.dart';
import 'package:smit_smit_media_player/services/api_services.dart';

class MediaListController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Media> medialList = <Media>[].obs;

  @override
  void onInit() {
    getSong();
    super.onInit();
  }

  Future<void> getSong({String search = ""}) async {
    try {
      isLoading(true);
      List<Media> data = await ApiServices.instance.fetchVideos(query: search);
      medialList = data.obs;

      isLoading(false);
    } catch (e) {
      log(e.toString());
    }
  }
}
