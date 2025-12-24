import 'package:flutter/cupertino.dart';

class VideoControllers extends ChangeNotifier{
  bool isPlaying = false;

  void playVideo(){
    isPlaying = true;
    notifyListeners();
  }
  void pauseVideo(){
    isPlaying = false;
    notifyListeners();
  }
}