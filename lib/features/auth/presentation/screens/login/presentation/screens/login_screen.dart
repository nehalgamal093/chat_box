import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/common_widgets/auth_text_field.dart';
import '../../../../../../../core/common_widgets/custom_divider.dart';
import '../../../../../../starting/presentation/widgets/row_icons.dart';
import '../widgets/login_button.dart';
import '../widgets/welcome_text.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = StringsManager.loginScreenRoute;
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Text(
                  StringsManager.loginToChatBox,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 20),
                WelcomeText(),
                SizedBox(height: 20),
                RowIcons(),
                SizedBox(height: 20),
                CustomDivider(),
                SizedBox(height: 20),

                AuthTextField(
                  controller: emailController,
                  label: StringsManager.yourEmail,
                ),
                SizedBox(height: 20),
                AuthTextField(
                  controller: passwordController,
                  label: StringsManager.password,
                ),
                SizedBox(height: 50),
                LoginButton(),
                SizedBox(height: 20),
                Text(
                  StringsManager.forgetPassword,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14,
                    color: ColorsManager.cyan,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
