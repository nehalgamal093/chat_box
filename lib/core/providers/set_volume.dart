import 'package:flutter/cupertino.dart';

class SetVolumeProvider extends ChangeNotifier{
  bool volumeOn = true;
  void turnVolume(){
    volumeOn = !volumeOn;
    notifyListeners();
  }
}