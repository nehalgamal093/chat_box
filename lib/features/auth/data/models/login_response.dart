class LoginResponse {
  String? id;
  String? fullName;
  String? email;
  String? profilePic;
  String? token;

  LoginResponse(
      {this.id, this.fullName, this.email, this.profilePic, this.token});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["fullName"] = fullName;
    map["email"] = email;
    map["profilePic"] = profilePic;
    map["token"] = token;
    return map;
  }

  LoginResponse.fromJson(dynamic json){
    id = json["_id"];
    fullName = json["fullName"];
    email = json["email"];
    profilePic = json["profilePic"];
    token = json["token"];
  }
}