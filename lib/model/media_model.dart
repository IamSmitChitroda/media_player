import 'package:get/get.dart';

class Media {
  RxString kind;
  RxString etag;
  Rx<Id> id;
  Rx<Snippet> snippet;

  Media({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        kind: json["kind"].toString().obs,
        etag: json["etag"].toString().obs,
        id: Id.fromJson(json["id"] ?? {}).obs,
        snippet: Snippet.fromJson(json["snippet"] ?? {}).obs,
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id.toJson(),
        "snippet": snippet.toJson(),
      };
}

class Id {
  RxString kind;
  RxString videoId;

  Id({
    required this.kind,
    required this.videoId,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: json["kind"].toString().obs,
        videoId: json["videoId"].toString().obs,
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "videoId": videoId,
      };
}

class Snippet {
  RxString publishedAt;
  RxString channelId;
  RxString title;
  RxString description;
  Rx<Thumbnails> thumbnails;
  RxString channelTitle;
  RxString liveBroadcastContent;
  RxString publishTime;

  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.liveBroadcastContent,
    required this.publishTime,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: json["publishedAt"].toString().obs,
        channelId: json["channelId"].toString().obs,
        title: json["title"].toString().obs,
        description: json["description"].toString().obs,
        thumbnails: Thumbnails.fromJson(json["thumbnails"]).obs,
        channelTitle: json["channelTitle"].toString().obs,
        liveBroadcastContent: json["liveBroadcastContent"].toString().obs,
        publishTime: json["publishTime"].toString().obs,
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt,
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        "channelTitle": channelTitle,
        "liveBroadcastContent": liveBroadcastContent,
        "publishTime": publishTime,
      };
}

class Thumbnails {
  Rx<Default> thumbnailsDefault;
  Rx<Default> medium;
  Rx<Default> high;

  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"] ?? {}).obs,
        medium: Default.fromJson(json["medium"] ?? {}).obs,
        high: Default.fromJson(json["high"] ?? {}).obs,
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
      };
}

class Default {
  RxString url;
  RxString width;
  RxString height;

  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"].toString().obs,
        width: json["width"].toString().obs,
        height: json["height"].toString().obs,
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}
