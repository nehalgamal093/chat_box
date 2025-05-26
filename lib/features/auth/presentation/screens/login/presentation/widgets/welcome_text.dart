import 'package:flutter/material.dart';
import '../../../../../../../core/resources/strings/strings_manager.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .9,
      child: Text(
        StringsManager.welcomeLogin,
        maxLines: 2,
        style: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(fontSize: 14),
      ),
    );
  }
}
