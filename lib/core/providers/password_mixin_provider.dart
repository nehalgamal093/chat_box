import 'package:chat_box/core/logic/validations/password_validation.dart';
import 'package:flutter/cupertino.dart';

mixin PasswordMixinProvider on ChangeNotifier{
  final PasswordValidation _passwordValidation = PasswordValidation();

  String errorPasswordText = "";

  bool isPasswordValid = false;

  void validatePassword(String value){
    _passwordValidation.validate(value);
    _passwordValidation.errorStream.listen((error){
      errorPasswordText = error;
      if(error.isEmpty){
        isPasswordValid = true;
      }
      notifyListeners();
    });
  }
}