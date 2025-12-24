import 'package:flutter/cupertino.dart';

class UpdateMyData extends ChangeNotifier {
  String bio = "";
  void changeMyBio(String bio) {
    this.bio = bio;
    notifyListeners();
  }
}
