import 'package:Media_Player/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presention/media_list/media_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff212428ff),
      ),
      debugShowCheckedModeBanner: false,
      getPages: Routes.routeList,
      initialRoute: Routes.mediaList,
    );
  }
}

/// YT API KEY: AIzaSyDmEnpCsWQLldwAMBMpxdL6YYrBpOWW8II
