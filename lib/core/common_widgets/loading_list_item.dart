import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class LoadingListItem extends StatelessWidget {
  const LoadingListItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height*.10,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.secondaryClr),
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}
