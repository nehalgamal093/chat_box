import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final Widget suffixIcon;
  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.isPassword,
    required this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 14,
            color: ColorsManager.cyan,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: UnderlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: ColorsManager.grey),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: ColorsManager.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: ColorsManager.grey),
            ),
          ),
        ),
      ],
    );
  }
}
