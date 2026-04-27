import 'package:flutter/material.dart';

import '../../../../core/resources/colors/colors_manager.dart';
import '../../../../core/resources/fonts/custom_fonts.dart';
import '../../../../core/resources/strings/strings_manager.dart';

class ActiveNow extends StatelessWidget {
  const ActiveNow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CircleAvatar(backgroundColor:ColorsManager.activeColor ,radius: 3,),
        SizedBox(width: 5,),
        Text(StringsManager.activeNow,
            style:CustomFonts.small00(fontColor: ColorsManager.activeColor)),
      ],
    );
  }
}
