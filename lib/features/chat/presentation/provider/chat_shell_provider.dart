import 'package:flutter/cupertino.dart';

class ChatShellProvider  extends ChangeNotifier{
  int index = 0;

  void changeIndex(int index){
   this.index = index;
   notifyListeners();
  }
}