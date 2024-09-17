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
      initialRoute: Routes.splash,
    );
  }
}

/// YT API KEY1: AIzaSyDmEnpCsWQLldwAMBMpxdL6YYrBpOWW8II
/// YT API KEY2: AIzaSyARwQ_Qhm9Ongbuzte5JJFO6lLjzJQsaT4
/// YT API KEY3: AIzaSyCBXOeiwRxbz2Vx8j2oGnWbG60cj1InN7Y
