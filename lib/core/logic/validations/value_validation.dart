import 'dart:async';

import 'package:chat_box/core/logic/validations/validation.dart';

class ValueValidation extends Validation{
  final StreamController<String> _errorValueController = StreamController<String>.broadcast();

  @override
  Stream<String> get errorStream => _errorValueController.stream;

  @override
  void validate(String value) {
    if(emptyText(value)){
      _errorValueController.add('Field is required');
    }else{
      _errorValueController.add('');
    }
  }
  @override
  void dispose() {
    _errorValueController.close();
  }

}