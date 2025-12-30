import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/common_widgets/custom_button.dart';
import '../../../auth/presentation/screens/register/presentation/screens/register_screen.dart';

class RegisterBtn extends StatelessWidget {
  const RegisterBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: StringsManager.signUpEmail,
            textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorsManager.secondaryClr,
              fontWeight: FontWeight.w500,
            ),
            color: ColorsManager.whiteColor,
            onPressed: () {
              Navigator.pushNamed(context, RegisterScreen.routeName);
            },
          ),
        ),
      ],
    );
  }
}
