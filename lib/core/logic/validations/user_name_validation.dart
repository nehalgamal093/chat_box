import 'dart:async';

import 'package:chat_box/core/logic/validations/validation.dart';

class UserNameValidation extends Validation{
  final StreamController<String> _errorUserNameController = StreamController<String>.broadcast();

  @override
  Stream<String> get errorStream => _errorUserNameController.stream;

  @override
  void validate(String value) {
    if(emptyText(value)){
      _errorUserNameController.add('Username is required');
    }else{
      _errorUserNameController.add('');
    }
  }
  @override
  void dispose() {
    _errorUserNameController.close();
  }

}