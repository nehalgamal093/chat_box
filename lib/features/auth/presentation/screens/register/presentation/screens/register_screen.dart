import 'package:chat_box/core/common_widgets/loading_dialog.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/auth/data/models/register_request.dart';
import 'package:chat_box/features/auth/presentation/screens/login/presentation/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_box/features/auth/presentation/screens/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/common_widgets/auth_text_field.dart';
import '../../../../../../../core/di/di.dart';
import '../widgets/register_button.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = StringsManager.registerScreenRoute;
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController fcmTokenController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: BlocProvider(
            create: (context) => getIt<RegisterBloc>(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocConsumer<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        StringsManager.signUpEmail,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: size.width * .9,
                        child: Text(
                          StringsManager.getChattingWithFriends,
                          maxLines: 2,
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall!.copyWith(fontSize: 14),
                        ),
                      ),
                      AuthTextField(
                        controller: fullNameController,
                        label: StringsManager.fullName,
                      ),
                      AuthTextField(
                        controller: usernameController,
                        label: StringsManager.username,
                      ),
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
                      SizedBox(height: 20),
                      AuthTextField(
                        controller: confirmPasswordController,
                        label: StringsManager.confirmPassword,
                      ),
                      SizedBox(height: 20),
                      AuthTextField(
                        controller: genderController,
                        label: StringsManager.gender,
                      ),
                      SizedBox(height: 50),
                      RegisterButton(
                        onPressed: () {
                          RegisterRequest request = RegisterRequest(
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                            username: usernameController.text,
                            fullName: fullNameController.text,
                            gender: genderController.text,
                            fcmToken: "333",
                          );
                          BlocProvider.of<RegisterBloc>(
                            context,
                          ).add(OnRegisterEvent(request));
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
                listener: (BuildContext context, RegisterState state) {
                  if (state.registerStates == RegisterStates.loading) {
                    loadingDialog(context);
                  } else if (state.registerStates == RegisterStates.success) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  } else if (state.registerStates == RegisterStates.failed) {
                    print(state.failures?.message);
                  } else {}
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
