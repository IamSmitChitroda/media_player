import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presention/media_list/media_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicListView(),
    );
  }
}

/// YT API KEY: AIzaSyDmEnpCsWQLldwAMBMpxdL6YYrBpOWW8II
