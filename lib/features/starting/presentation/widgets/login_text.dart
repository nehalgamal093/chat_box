import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/common_widgets/custom_text_span.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, StringsManager.loginScreenRoute);
        },
        child: CustomTextSpan(
          mainText: StringsManager.existingAccount,
          secondaryText: StringsManager.login,
          mainStyle: Theme.of(context).textTheme.bodySmall!,
          secondaryStyle: Theme.of(context).textTheme.titleLarge!,
        ),
      ),
    );
  }
}
