import 'package:flutter/material.dart';

class CustomTextSpan extends StatelessWidget {
  final String mainText;
  final TextStyle mainStyle;
  final String secondaryText;
  final TextStyle secondaryStyle;
  const CustomTextSpan({
    super.key,
    required this.mainText,
    required this.secondaryText,
    required this.mainStyle,
    required this.secondaryStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: mainText,
        children: [TextSpan(text: secondaryText, style: secondaryStyle)],
      ),
    );
  }
}
