import 'package:chat_box/core/di/di.dart';
import 'package:chat_box/core/providers/password_visibility_provider.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/fonts/custom_fonts.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/auth/presentation/screens/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/common_widgets/auth_text_field.dart';
import '../../../../../../../core/common_widgets/custom_divider.dart';
import '../../../../../../../core/common_widgets/loading_dialog.dart';
import '../../../../../../main/presentation/screens/main_screen.dart';
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
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => PasswordVisibilityProvider(),
      child: Consumer<PasswordVisibilityProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return Container(
            decoration: BoxDecoration(
                gradient:LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5,.8],
                  colors: ColorsManager.backGroundGradient,
                )
            ),
            child: Scaffold(
              backgroundColor: ColorsManager.transparent,
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: SizedBox(
                  height: size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: BlocProvider(
                      create: (context) => getIt<LoginBloc>(),
                      child: BlocConsumer<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                StringsManager.loginToChatBox,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              SizedBox(height: 10),
                              WelcomeText(),
                              SizedBox(height: 60),
                              RowIcons(),
                              SizedBox(height: 20),
                              CustomDivider(),
                              SizedBox(height: 50),
                              AuthTextField(
                                focusNode: focusNodeEmail,
                                nextFocus: focusNodePassword,
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: ColorsManager.whiteColor,
                                ),
                                isPassword: false,
                                controller: emailController,
                                label: StringsManager.yourEmail,
                              ),
                              SizedBox(height: 20),
                              AuthTextField(
                                focusNode: focusNodePassword,
                                nextFocus: focusNodePassword,
                                suffixIcon: value.visible
                                    ? InkWell(
                                        onTap: () {
                                          value.changeVisibility();
                                        },
                                        child: Icon(
                                          Icons.visibility_outlined,
                                          color: ColorsManager.whiteColor,
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          value.changeVisibility();
                                        },
                                        child: Icon(
                                          Icons.visibility_off_outlined,
                                          color: ColorsManager.whiteColor,
                                        ),
                                      ),
                                isPassword: !value.visible,
                                controller: passwordController,
                                label: StringsManager.password,
                              ),
                              SizedBox(height: 50),
                              LoginButton(
                                onPressed: () {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    OnLoginEvent(
                                      emailController.text,
                                      passwordController.text,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  StringsManager.forgetPassword,
                                  style: CustomFonts.small00(fontColor: ColorsManager.purple02)
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          );
                        },
                        listener: (BuildContext context, LoginState state) {
                          if (state.loginStates == LoginStates.loading) {
                            loadingDialog(context);
                          } else if (state.loginStates == LoginStates.success) {
                            Navigator.pop(context);
                            Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName,(route)=>false);
                          } else if (state.loginStates == LoginStates.failed) {
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
