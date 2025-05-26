import 'package:flutter/material.dart';
import '../resources/colors/colors_manager.dart';

class CustomIcon extends StatelessWidget {
  final String image;
  const CustomIcon({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: ColorsManager.whiteColor),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image.asset(image),
      ),
    );
  }
}
