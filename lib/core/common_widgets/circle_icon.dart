import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final String icon;
  const CircleIcon({super.key,required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:ColorsManager.circleColor,
      child: ImageIcon(AssetImage(icon),color: ColorsManager.whiteColor,),
    );
  }
}
