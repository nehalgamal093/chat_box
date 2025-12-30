import 'dart:io';
import 'package:chat_box/features/camera_screen/presentation/view_photo_input.dart';
import 'package:flutter/material.dart';
import '../../../messages/data/models/chatted_users.dart';

class ViewPhotoScreen extends StatelessWidget {
  final User user;
  final String path;


  const ViewPhotoScreen({super.key, required this.path, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Image', style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: Column(
        children: [
          Expanded(child: Image.file(File(path))),
          ViewPhotoInput(path: path, user: user),
        ],
      ),
    );
  }
}
