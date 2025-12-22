class DataList {
  String? id;
  String? fullName;
  String? username;
  String? gender;
  String? profilePicture;
  String? bio;
  List<String>? friendsList;
  List<dynamic>? friendRequestsList;
  List<String>? sentRequestsList;
  String? createdAt;
  String? updatedAt;
  num? v;

  DataList(
      {this.id, this.fullName, this.username, this.gender, this.profilePicture,this.bio, this.friendsList, this.friendRequestsList, this.sentRequestsList, this.createdAt, this.updatedAt, this.v});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["fullName"] = fullName;
    map["username"] = username;
    map["gender"] = gender;
    map["profilePicture"] = profilePicture;
    map["bio"] = bio;
    map["friends"] = friendsList;
    if (friendRequestsList != null) {
      map["friendRequests"] =
          friendRequestsList?.map((v) => v.toJson()).toList();
    }
    map["sentRequests"] = sentRequestsList;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    return map;
  }

  DataList.fromJson(dynamic json){
    id = json["_id"];
    fullName = json["fullName"];
    username = json["username"];
    gender = json["gender"];
    profilePicture = json["profilePicture"];
    bio = json["bio"];
    friendsList = json["friends"] != null ? json["friends"].cast<String>() : [];
    if (json["friendRequests"] != null) {
      friendRequestsList = [];
    }
    sentRequestsList =
    json["sentRequests"] != null ? json["sentRequests"].cast<String>() : [];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }
}

class SearchResult {
  List<DataList>? dataListList;

  SearchResult({this.dataListList});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dataListList != null) {
      map["dataList"] = dataListList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  SearchResult.fromJson(dynamic json){
    if (json != null) {
      dataListList = [];
      json.forEach((v) {
        dataListList?.add(DataList.fromJson(v));
      });
    }
  }
}