class NewMessage {
  String? senderId;
  String? receiverId;
  String? message;
  String? mediaUrl;
  String? mediaType;
  String? id;
  String? createdAt;
  String? updatedAt;
  num? v;

  NewMessage(
      {this.senderId, this.receiverId, this.message, this.mediaUrl, this.mediaType, this.id, this.createdAt, this.updatedAt, this.v});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["senderId"] = senderId;
    map["receiverId"] = receiverId;
    map["message"] = message;
    map["mediaUrl"] = mediaUrl;
    map["mediaType"] = mediaType;
    map["_id"] = id;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    return map;
  }

  NewMessage.fromJson(dynamic json){
    senderId = json["senderId"];
    receiverId = json["receiverId"];
    message = json["message"];
    mediaUrl = json["mediaUrl"];
    mediaType = json["mediaType"];
    id = json["_id"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }
}

class SendMessageResponse {
  String? message;
  NewMessage? newMessage;

  SendMessageResponse({this.message, this.newMessage});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["message"] = message;
    if (newMessage != null) {
      map["newMessage"] = newMessage?.toJson();
    }
    return map;
  }

  SendMessageResponse.fromJson(dynamic json){
    message = json["message"];
    newMessage =
    json["newMessage"] != null ? NewMessage.fromJson(json["newMessage"]) : null;
  }
}