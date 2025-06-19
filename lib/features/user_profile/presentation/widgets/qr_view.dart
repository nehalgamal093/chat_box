import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

qrView(BuildContext context, String id) {
  print(">>>>> $id");
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          color: ColorsManager.whiteColor,
            width:600,
            height: 300,
            child: Center(child: QrImageView(data: id, version: QrVersions.auto, size: 300.0))),
      );
    },
  );
}
