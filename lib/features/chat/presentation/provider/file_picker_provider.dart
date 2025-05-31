
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerProvider extends ChangeNotifier{
  File file =File.fromUri(Uri());

  void pickFile()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
    }
    notifyListeners();
  }
  void clear(){
    file = File.fromUri(Uri());
    notifyListeners();
  }
}