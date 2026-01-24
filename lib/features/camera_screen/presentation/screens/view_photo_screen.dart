import 'dart:io';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/camera_screen/presentation/view_photo_input.dart';
import 'package:flutter/material.dart';

class ViewPhotoScreen extends StatelessWidget {
  final String userId;
  final String path;

  const ViewPhotoScreen({super.key, required this.path, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.viewImage,
            style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.file(
              File(path),
            ),
          ),
          ViewPhotoInput(path: path, userId: userId),
        ],
      ),
    );
  }
}
