import 'package:flutter/cupertino.dart';

class PasswordVisibilityProvider extends ChangeNotifier {
  bool visible = false;

  void changeVisibility() {
    visible = !visible;
    notifyListeners();
  }
}
