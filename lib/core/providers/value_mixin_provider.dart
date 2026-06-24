import 'package:chat_box/core/logic/validations/value_validation.dart';
import 'package:flutter/material.dart';

mixin ValueMixinProvider  on ChangeNotifier{
  final ValueValidation _valueValidation = ValueValidation();
  bool isValueValid = false;
  String errorValueText = "";

  void validateValue(String value) {
    _valueValidation.validate(value);
    _valueValidation.errorStream.listen((error) {
      errorValueText = error;
      if (error.isEmpty) {
        isValueValid = true;
      }
      notifyListeners();
    });
  }
}