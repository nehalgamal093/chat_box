class User {
  String? id;
  String? fullName;
  String? username;
  String? gender;
  String? profilePic;
  String? createdAt;
  String? updatedAt;
  num? v;

  User(
      {this.id, this.fullName, this.username, this.gender, this.profilePic, this.createdAt, this.updatedAt, this.v});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["fullName"] = fullName;
    map["username"] = username;
    map["gender"] = gender;
    map["profilePic"] = profilePic;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    return map;
  }

  User.fromJson(dynamic json){
    id = json["_id"];
    fullName = json["fullName"];
    username = json["username"];
    gender = json["gender"];
    profilePic = json["profilePic"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }
}

class LastMessage {
  String? id;
  String? senderId;
  String? receiverId;
  String? message;
  dynamic mediaUrl;
  String? mediaType;
  String? createdAt;
  String? updatedAt;
  num? v;

  LastMessage(
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

  LastMessage.fromJson(dynamic json){
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

class DataList {
  User? user;
  LastMessage? lastMessage;
  String? conversationId;

  DataList({this.user, this.lastMessage, this.conversationId});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map["user"] = user?.toJson();
    }
    if (lastMessage != null) {
      map["lastMessage"] = lastMessage?.toJson();
    }
    map["conversationId"] = conversationId;
    return map;
  }

  DataList.fromJson(dynamic json){
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
    lastMessage = json["lastMessage"] != null
        ? LastMessage.fromJson(json["lastMessage"])
        : null;
    conversationId = json["conversationId"];
  }
}

class ChattedUsers {
  List<DataList>? dataListList;

  ChattedUsers({this.dataListList});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dataListList != null) {
      map["dataList"] = dataListList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  ChattedUsers.fromJson(dynamic json){
    if (json != null) {
      dataListList = [];
      json.forEach((v) {
        dataListList?.add(DataList.fromJson(v));
      });
    }
  }
}