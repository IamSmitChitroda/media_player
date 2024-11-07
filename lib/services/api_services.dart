import 'dart:developer';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/media_model.dart';

class ApiServices {
  ApiServices._();
  static final ApiServices instance = ApiServices._();

  final String _apiKey = 'AIzaSyDFRW13X5f5R5WPyfKa2hRL5jz88fIxdEs';
  final String _baseUrl = 'https://www.googleapis.com/youtube/v3/search';

  // Method to fetch videos from YouTube API
  Future<List<Media>> fetchVideos({required String query}) async {
    try {
      final url = Uri.parse(
          '$_baseUrl?part=snippet&maxResults=50&q=$query&type=song&key=$_apiKey');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final List items = data['items'];

        return items.map((e) => Media.fromJson(e ?? {})).toList();
      } else {
        throw Exception(
            'Failed to load videos. Status code: ${response.statusCode}');
      }
    } catch (e) {
      Logger().e('Error fetching videos: $e');
      return [];
    }
  }
}
