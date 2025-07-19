import 'package:flutter/material.dart';

class ShowScrollButton extends ChangeNotifier{
  bool isVisible = false;

  void showScrollButton(){
    isVisible = true;
    notifyListeners();
  }
  void hideScrollButton(){
    isVisible = false;
    notifyListeners();
  }
}