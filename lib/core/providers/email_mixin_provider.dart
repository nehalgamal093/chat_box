import 'package:chat_box/core/logic/validations/email_validation.dart';
import 'package:flutter/cupertino.dart';

mixin EmailMixinProvider on ChangeNotifier {
  final EmailValidation _emailValidation = EmailValidation();
  bool isEmailValid = false;
  String errorEmailText = "";

  void validateEmail(String value) {
    _emailValidation.validate(value);
    _emailValidation.errorStream.listen((error) {
      errorEmailText = error;
      if (error.isEmpty) {
        isEmailValid = true;
      }
      notifyListeners();
    });
  }
}
