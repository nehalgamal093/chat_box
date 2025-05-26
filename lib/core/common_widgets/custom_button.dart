import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;
  final TextStyle textStyle;
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        backgroundColor: color,
      ),
      child: Text(text,style: textStyle,),
    );
  }
}
