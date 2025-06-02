class Friends {
  String? id;
  String? fullName;
  String? username;
  String? profilePic;

  Friends({this.id, this.fullName, this.username, this.profilePic});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["fullName"] = fullName;
    map["username"] = username;
    map["profilePic"] = profilePic;
    return map;
  }

  Friends.fromJson(dynamic json){
    id = json["_id"];
    fullName = json["fullName"];
    username = json["username"];
    profilePic = json["profilePic"];
  }
}

class UserProfile {
  String? id;
  String? fullName;
  String? username;
  String? gender;
  String? profilePic;
  List<Friends>? friendsList;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? friendStatus;

  UserProfile(
      {this.id, this.fullName, this.username, this.gender, this.profilePic, this.friendsList, this.createdAt, this.updatedAt, this.v, this.friendStatus});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["fullName"] = fullName;
    map["username"] = username;
    map["gender"] = gender;
    map["profilePic"] = profilePic;
    if (friendsList != null) {
      map["friends"] = friendsList?.map((v) => v.toJson()).toList();
    }
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    map["friendStatus"] = friendStatus;
    return map;
  }

  UserProfile.fromJson(dynamic json){
    id = json["_id"];
    fullName = json["fullName"];
    username = json["username"];
    gender = json["gender"];
    profilePic = json["profilePic"];
    if (json["friends"] != null) {
      friendsList = [];
      json["friends"].forEach((v) {
        friendsList?.add(Friends.fromJson(v));
      });
    }
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    friendStatus = json["friendStatus"];
  }
}