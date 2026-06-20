import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/fonts/custom_fonts.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final Widget suffixIcon;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final String? errorText;
  final void Function(String)? onChanged;
  const AuthTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.isPassword,
      required this.suffixIcon,
      required this.focusNode,
      required this.nextFocus,this.onChanged,this.errorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: CustomFonts.med02(),
        ),
        SizedBox(height: 10),
        TextField(

          focusNode: focusNode,
          textInputAction: TextInputAction.next,
          obscureText: isPassword,
          controller: controller,
          cursorColor: ColorsManager.whiteColor,
          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(nextFocus);
          },
          onChanged:onChanged,
          decoration: InputDecoration(
            errorText:errorText ,
            suffixIcon: suffixIcon,
            border: UnderlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: ColorsManager.grey),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: ColorsManager.grey),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: ColorsManager.grey),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: ColorsManager.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: ColorsManager.grey),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
