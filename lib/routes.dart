import 'package:get/get.dart';

import 'presention/media/media_screen.dart';
import 'presention/media_list/media_list_screen.dart';

class Routes {
  static String splash = "/Splash";
  static String mediaList = "/MediaList";
  static String media = "/Media";

  static List<GetPage> routeList = [
    GetPage(name: mediaList, page: () => MediaListScreen()),
    GetPage(name: media, page: () => MediaScreen()),
  ];
}
