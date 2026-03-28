import 'package:flutter/cupertino.dart';

class VideoControllers extends ChangeNotifier{
  bool isPlaying = false;
  double position  = 0.0;
  bool drag = false;
  void playVideo(){
    isPlaying = true;
    notifyListeners();
  }
  void pauseVideo(){
    isPlaying = false;
    notifyListeners();
  }
  void sliderPosition(double position){
    this.position = position;
    notifyListeners();
  }
  void setDragging(bool drag){
    this.drag = drag;
    notifyListeners();
  }
}