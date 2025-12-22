class Friends {
  String? id;
  String? fullName;
  String? username;
  String? profilePicture;

  Friends({this.id, this.fullName, this.username, this.profilePicture});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["fullName"] = fullName;
    map["username"] = username;
    map["profilePicture"] = profilePicture;
    return map;
  }

  Friends.fromJson(dynamic json){
    id = json["_id"];
    fullName = json["fullName"];
    username = json["username"];
    profilePicture = json["profilePicture"];
  }
}

class UserProfile {
  String? id;
  String? fullName;
  String? username;
  String? gender;
  String? profilePicture;
  List<Friends>? friendsList;
  String? createdAt;
  String? bio;
  String? updatedAt;
  num? v;
  String? friendStatus;

  UserProfile(
      {this.id, this.fullName, this.username, this.gender, this.profilePicture, this.friendsList, this.createdAt, this.bio,this.updatedAt, this.v, this.friendStatus});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["fullName"] = fullName;
    map["username"] = username;
    map["gender"] = gender;
    map["bio"] = bio;
    map["profilePicture"] = profilePicture;
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
    bio = json["bio"];
    profilePicture = json["profilePicture"];
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