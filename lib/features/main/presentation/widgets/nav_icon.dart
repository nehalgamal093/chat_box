import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {
  final String image;
  final bool isSelected;
  const NavIcon({super.key,required this.image,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ?ColorsManager.lightBlue:Colors.transparent
      ),
      child: ImageIcon(AssetImage(image),size: 30,),
    );
  }
}
