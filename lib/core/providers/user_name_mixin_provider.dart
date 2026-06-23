import 'package:chat_box/core/logic/validations/user_name_validation.dart';
import 'package:flutter/material.dart';

mixin UserNameMixinProvider  on ChangeNotifier{
  final UserNameValidation _userNameValidation = UserNameValidation();
  bool isUserNameValid = false;
  String errorUserNameText = "";

  void validateUsername(String value) {
    _userNameValidation.validate(value);
    _userNameValidation.errorStream.listen((error) {
      errorUserNameText = error;
      if (error.isEmpty) {
        isUserNameValid = true;
      }
      notifyListeners();
    });
  }
}