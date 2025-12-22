class ChangePhotoResponse {
  String? message;
  String? media;

  ChangePhotoResponse({this.message, this.media});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["message"] = message;
    map["media"] = media;
    return map;
  }

  ChangePhotoResponse.fromJson(dynamic json){
    message = json["message"];
    media = json["media"];
  }
}