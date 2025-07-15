class Message {
  String? id;
  String? senderId;
  String? receiverId;
  String? message;
  String? mediaUrl;
  String? mediaType;
  String? createdAt;
  String? updatedAt;
  num? v;

  Message(
      {this.id, this.senderId, this.receiverId, this.message, this.mediaUrl, this.mediaType, this.createdAt, this.updatedAt, this.v});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["senderId"] = senderId;
    map["receiverId"] = receiverId;
    map["message"] = message;
    map["mediaUrl"] = mediaUrl;
    map["mediaType"] = mediaType;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    return map;
  }

  Message.fromJson(dynamic json){
    id = json["_id"];
    senderId = json["senderId"];
    receiverId = json["receiverId"];
    message = json["message"];
    mediaUrl = json["mediaUrl"];
    mediaType = json["mediaType"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }
}

class Messages {
  List<Message>? messagesList;
  num? currentPage;
  num? totalPages;

  Messages({this.messagesList, this.currentPage, this.totalPages});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (messagesList != null) {
      map["messages"] = messagesList?.map((v) => v.toJson()).toList();
    }
    map["currentPage"] = currentPage;
    map["totalPages"] = totalPages;
    return map;
  }

  Messages.fromJson(dynamic json){
    if (json["messages"] != null) {
      messagesList = [];
      json["messages"].forEach((v) {
        messagesList?.add(Message.fromJson(v));
      });
    }
    currentPage = json["currentPage"];
    totalPages = json["totalPages"];
  }
}