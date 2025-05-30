class DataList {
  List<dynamic>? friendsList;
  List<dynamic>? friendRequestsList;
  List<dynamic>? sentRequestsList;
  String? id;
  String? fullName;
  String? username;
  String? gender;
  String? profilePic;
  String? createdAt;
  String? updatedAt;
  num? v;

  DataList(
      {this.friendsList, this.friendRequestsList, this.sentRequestsList, this.id, this.fullName, this.username, this.gender, this.profilePic, this.createdAt, this.updatedAt, this.v});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (friendsList != null) {
      map["friends"] = friendsList?.map((v) => v.toJson()).toList();
    }
    if (friendRequestsList != null) {
      map["friendRequests"] =
          friendRequestsList?.map((v) => v.toJson()).toList();
    }
    if (sentRequestsList != null) {
      map["sentRequests"] = sentRequestsList?.map((v) => v.toJson()).toList();
    }
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

  DataList.fromJson(dynamic json){
    if (json["friends"] != null) {
      friendsList = [];
    }
    if (json["friendRequests"] != null) {
      friendRequestsList = [];
    }
    if (json["sentRequests"] != null) {
      sentRequestsList = [];
    }
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

class Friends {
  List<DataList>? dataListList;

  Friends({this.dataListList});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dataListList != null) {
      map["dataList"] = dataListList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  Friends.fromJson(dynamic json){
    if (json != null) {
      dataListList = [];
      json.forEach((v) {
        dataListList?.add(DataList.fromJson(v));
      });
    }
  }
}