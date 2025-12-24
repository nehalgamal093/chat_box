import 'dart:io';
import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/chat/presentation/provider/file_picker_provider.dart';

class CirclePicture extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final bool isMyPicture;
  const CirclePicture(
      {super.key,
      required this.imageUrl,
      required this.radius,
      this.isMyPicture = false});

  @override
  Widget build(BuildContext context) {
    var pickFileProvider = Provider.of<FilePickerProvider>(context);
    return CircleAvatar(
      radius: radius,
      backgroundImage: getPicture(pickFileProvider),
    );
  }

  getPicture(FilePickerProvider pickFile) {
    if (pickFile.file.path.isEmpty||!isMyPicture) {
      if (imageUrl.isEmpty || imageUrl == null) {
        return AssetImage(ImagesManager.avatar);
      } else {
        return NetworkImage(imageUrl);
      }
    } else if (pickFile.file.path.isNotEmpty && isMyPicture) {
      return FileImage(File(pickFile.file.path));
    }
  }
}
