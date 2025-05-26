class RegisterRequest {
  String? fullName;
  String? username;
  String? password;
  String? email;
  String? confirmPassword;
  String? gender;
  String? fcmToken;

  RegisterRequest(
      {this.fullName, this.username, this.password, this.email, this.confirmPassword, this.gender, this.fcmToken});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["fullName"] = fullName;
    map["username"] = username;
    map["password"] = password;
    map["email"] = email;
    map["confirmPassword"] = confirmPassword;
    map["gender"] = gender;
    map["fcmToken"] = fcmToken;
    return map;
  }

  RegisterRequest.fromJson(dynamic json){
    fullName = json["fullName"];
    username = json["username"];
    password = json["password"];
    email = json["email"];
    confirmPassword = json["confirmPassword"];
    gender = json["gender"];
    fcmToken = json["fcmToken"];
  }
}