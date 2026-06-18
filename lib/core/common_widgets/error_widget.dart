import 'package:flutter/material.dart';

import '../resources/colors/colors_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  const CustomErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
          color: ColorsManager.redColor,
          border: Border.all(width: 1, color: Colors.black)),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
