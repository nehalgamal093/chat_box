import 'package:chat_box/core/common_widgets/loading_dialog.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/auth/data/models/register_request.dart';
import 'package:chat_box/features/auth/presentation/screens/login/presentation/screens/login_screen.dart';
import 'package:chat_box/features/auth/presentation/screens/register/presentation/providers/register_confirm_password_provider.dart';
import 'package:chat_box/features/auth/presentation/screens/register/presentation/providers/register_email_provider.dart';
import 'package:chat_box/features/auth/presentation/screens/register/presentation/providers/register_full_name_provider.dart';
import 'package:chat_box/features/auth/presentation/screens/register/presentation/providers/register_gender_provider.dart';
import 'package:chat_box/features/auth/presentation/screens/register/presentation/providers/register_password_provider.dart';
import 'package:chat_box/features/auth/presentation/screens/register/presentation/providers/register_user_name_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_box/features/auth/presentation/screens/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/common_widgets/auth_text_field.dart';
import '../../../../../../../core/common_widgets/error_widget.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/providers/password_visibility_provider.dart';
import '../../../../../../../core/resources/colors/colors_manager.dart';
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
  final FocusNode focusNodeFullName = FocusNode();
  final FocusNode focusNodeUserName = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final FocusNode focusNodeGender = FocusNode();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    RegisterEmailProvider emailProvider =
        Provider.of<RegisterEmailProvider>(context);
    RegisterPasswordProvider passwordProvider =
        Provider.of<RegisterPasswordProvider>(context);
    RegisterConfirmPasswordProvider confirmPasswordProvider =
        Provider.of<RegisterConfirmPasswordProvider>(context);
    RegisterUserNameProvider userNameProvider = Provider.of<RegisterUserNameProvider>(context);
    RegisterFullNameProvider fullNameProvider = Provider.of<RegisterFullNameProvider>(context);
    RegisterGenderProvider genderProvider = Provider.of<RegisterGenderProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => PasswordVisibilityProvider(),
      child: Consumer<PasswordVisibilityProvider>(
          builder: (BuildContext context, value, Widget? child) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, .8],
            colors: ColorsManager.backGroundGradient,
          )),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(),
            body: SizedBox(
              height: size.height,
              child: BlocProvider(
                create: (context) => getIt<RegisterBloc>(),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      right: 16,
                      left: 16),
                  child: BlocConsumer<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return ListView(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            StringsManager.signUpEmail,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            width: size.width * .9,
                            child: Text(
                              StringsManager.getChattingWithFriends,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          SizedBox(height: 50),
                          AuthTextField(
                            focusNode: focusNodeFullName,
                            nextFocus: focusNodeUserName,
                            suffixIcon: Icon(Icons.person,
                                color: ColorsManager.whiteColor),
                            isPassword: false,
                            controller: fullNameController,
                            errorText: fullNameProvider.errorValueText,
                            label: StringsManager.fullName,
                            onChanged: (val){
                              fullNameProvider.validateValue(val);
                            },
                          ),
                          AuthTextField(
                            focusNode: focusNodeUserName,
                            nextFocus: focusNodeEmail,
                            suffixIcon: Icon(
                              Icons.account_circle_outlined,
                              color: ColorsManager.whiteColor,
                            ),
                            errorText: userNameProvider.errorValueText,
                            isPassword: false,
                            controller: usernameController,
                            label: StringsManager.username,
                            onChanged: (val) {
                              userNameProvider.validateValue(val);
                            },
                          ),
                          SizedBox(height: 20),
                          AuthTextField(
                            focusNode: focusNodeEmail,
                            nextFocus: focusNodePassword,
                            suffixIcon: Icon(Icons.email_outlined,
                                color: ColorsManager.whiteColor),
                            isPassword: false,
                            controller: emailController,
                            label: StringsManager.yourEmail,
                            errorText: emailProvider.errorEmailText,
                            onChanged: (val) {
                              emailProvider.validateEmail(val);
                            },
                          ),
                          SizedBox(height: 20),
                          AuthTextField(
                            focusNode: focusNodePassword,
                            nextFocus: focusNodeConfirmPassword,
                            errorText: passwordProvider.errorPasswordText,
                            onChanged: (val) {
                              passwordProvider.validatePassword(val);
                            },
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
                          SizedBox(height: 20),
                          AuthTextField(
                            focusNode: focusNodeConfirmPassword,
                            nextFocus: focusNodeGender,
                            errorText:
                                confirmPasswordProvider.errorPasswordText,
                            onChanged: (val) {
                              confirmPasswordProvider.validatePassword(val);
                            },
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
                            controller: confirmPasswordController,
                            label: StringsManager.confirmPassword,
                          ),
                          SizedBox(height: 20),
                          AuthTextField(
                            focusNode: focusNodeGender,
                            nextFocus: focusNodeGender,
                            suffixIcon: Icon(
                              Icons.person,
                              color: ColorsManager.whiteColor,
                            ),
                            isPassword: false,
                            controller: genderController,
                            label: StringsManager.gender,
                            errorText: genderProvider.errorValueText,
                            onChanged: (val){
                              genderProvider.validateValue(val);
                            },
                          ),
                          SizedBox(height: 30),
                          if (state.registerStates ==
                              RegisterStates.failed) ...[
                            CustomErrorWidget(
                                message: state.failures?.message ??
                                    StringsManager.error)
                          ],
                          SizedBox(height: 20),
                          RegisterButton(
                            onPressed: fullNameProvider.isValueValid&& userNameProvider.isValueValid&&genderProvider.isValueValid&&emailProvider.isEmailValid&&passwordProvider.isPasswordValid&&confirmPasswordProvider.isPasswordValid?() async {
                              RegisterRequest request = RegisterRequest(
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                username: usernameController.text,
                                fullName: fullNameController.text,
                                gender: genderController.text,
                              );
                              BlocProvider.of<RegisterBloc>(
                                context,
                              ).add(OnRegisterEvent(request));
                            }:null,
                          ),
                          SizedBox(height: 50),
                        ],
                      );
                    },
                    listener: (BuildContext context, RegisterState state) {
                      if (state.registerStates == RegisterStates.loading) {
                        loadingDialog(context);
                      } else if (state.registerStates ==
                          RegisterStates.success) {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      } else if (state.registerStates ==
                          RegisterStates.failed) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
    genderController.dispose();
    super.dispose();
  }
}
