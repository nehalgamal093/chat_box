import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/starting_screen/presentation/widgets/bold_title.dart';
import 'package:chat_box/features/starting_screen/presentation/widgets/custom_divider.dart';
import 'package:chat_box/features/starting_screen/presentation/widgets/regular_title.dart';
import 'package:chat_box/features/starting_screen/presentation/widgets/row_icons.dart';
import 'package:chat_box/features/starting_screen/presentation/widgets/starting_description.dart';
import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget {
  static const String routeName = StringsManager.startingScreenRoute;
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesManager.backgroundImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: ColorsManager.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(ImagesManager.smallLogo),
                  ),
                  SizedBox(height: 20),
                  RegularTitle(),
                  BoldTitle(),
                  SizedBox(height: 20),
                  StartingDescription(),
                  SizedBox(height: 20),
                  RowIcons(),
                  SizedBox(height: 20),
                 CustomDivider()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
