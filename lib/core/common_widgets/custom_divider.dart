import 'package:flutter/material.dart';

import '../resources/colors/colors_manager.dart';
import '../resources/strings/strings_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(indent: 20, endIndent: 20, color: ColorsManager.grey),
        ),
        Text(StringsManager.or, style: Theme.of(context).textTheme.titleSmall),
        Expanded(
          child: Divider(indent: 20, endIndent: 20, color: ColorsManager.grey),
        ),
      ],
    );
  }
}
