import 'package:flutter/material.dart';
import '../../../../core/resources/strings/strings_manager.dart';

class StartingDescription extends StatelessWidget {
  const StartingDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      StringsManager.startingPageDescription,
      maxLines: 2,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
