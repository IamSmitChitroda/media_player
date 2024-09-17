import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/media_model.dart';
import '../../services/api_services.dart';

class MediaListController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Media> medialList = <Media>[].obs;
  TextEditingController searchController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    await getSong();
  }

  Future<void> pullToRefresh() async {
    isLoading(true);
    medialList([]);
    searchController.clear();
    await getSong(search: "hindi hit song");
  }

  Future<void> getSong({String search = "hit song"}) async {
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
