class RegisterResponse {
  String? id;
  String? fullName;
  String? username;
  String? email;
  String? profilePic;
  String? fcmToken;

  RegisterResponse(
      {this.id, this.fullName, this.username, this.email, this.profilePic, this.fcmToken});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["fullName"] = fullName;
    map["username"] = username;
    map["email"] = email;
    map["profilePic"] = profilePic;
    map["fcmToken"] = fcmToken;
    return map;
  }

  RegisterResponse.fromJson(dynamic json){
    id = json["_id"];
    fullName = json["fullName"];
    username = json["username"];
    email = json["email"];
    profilePic = json["profilePic"];
    fcmToken = json["fcmToken"];
  }
}