import 'package:flutter/material.dart';

import '../../../../../../../core/common_widgets/custom_button.dart';
import '../../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../../core/resources/strings/strings_manager.dart';
import '../../../../../../main/presentation/screens/main_screen.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: StringsManager.login,
            color: ColorsManager.cyan,
            onPressed: () {
              Navigator.pushNamed(context, MainScreen.routeName);
            },
            textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorsManager.blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
