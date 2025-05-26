import 'package:flutter/material.dart';

import '../../../../../../../core/common_widgets/custom_button.dart';
import '../../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../../core/resources/strings/strings_manager.dart';

class RegisterButton extends StatelessWidget {
  final void Function()? onPressed;
  const RegisterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: StringsManager.createAccount,
            color: ColorsManager.cyan,
            onPressed: onPressed,
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
