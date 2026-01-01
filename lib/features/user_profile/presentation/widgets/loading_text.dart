import 'package:flutter/material.dart';

import '../../../../core/resources/colors/colors_manager.dart';

class LoadingText extends StatelessWidget {
  const LoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return  Container(
      height: 50,
      width: size.width * .8,
      decoration: BoxDecoration(
          color: ColorsManager.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),),
    );
  }
}
