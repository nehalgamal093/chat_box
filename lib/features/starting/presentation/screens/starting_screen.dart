import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/common_widgets/custom_divider.dart';
import '../widgets/bold_title.dart';
import '../widgets/login_text.dart';
import '../widgets/register_btn.dart';
import '../widgets/regular_title.dart';
import '../widgets/row_icons.dart';
import '../widgets/starting_description.dart';

class StartingScreen extends StatelessWidget {
  static const String routeName = StringsManager.startingScreenRoute;
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                SizedBox(height: 60),
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
                CustomDivider(),
                SizedBox(height: 20),
                RegisterBtn(),
                SizedBox(height: 30),
                LoginText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
