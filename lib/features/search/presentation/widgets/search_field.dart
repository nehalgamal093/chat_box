import 'package:flutter/material.dart';

import '../../../../core/resources/colors/colors_manager.dart';
import '../../../../core/resources/images/images_manager.dart';
import '../../../../core/resources/strings/strings_manager.dart';

class SearchField extends StatelessWidget {
  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  const SearchField({super.key,required this.textEditingController,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      onChanged: onChanged,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: StringsManager.search,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(color: ColorsManager.medGrey),
        fillColor: ColorsManager.chatInputColor,
        contentPadding: EdgeInsets.only(bottom: 10, left: 10),
        filled: true,
        prefixIcon: Image.asset(ImagesManager.search,width: 35,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 2.0,
            color: ColorsManager.chatInputColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 2.0,
            color: ColorsManager.chatInputColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 2.0,
            color: ColorsManager.chatInputColor,
          ),
        ),
      ),
    );
  }
}
