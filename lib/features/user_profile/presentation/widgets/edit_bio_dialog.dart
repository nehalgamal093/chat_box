import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

showEditDialog(TextEditingController controller,BuildContext context,void Function()? editBio) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        OutlineInputBorder border = OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.medGrey),
        );
        Size size = MediaQuery.of(context).size;
        return AlertDialog(
          backgroundColor: ColorsManager.darkBlue,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          title: Text(
            'Edit my bio',
            style: TextStyle(color: Colors.white),
          ),
          content: SizedBox(
            height: 100,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller:controller ,
                    decoration: InputDecoration(
                        enabledBorder: border,
                        focusedBorder: border,
                        border: border),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: (){
                  editBio!.call();
                  Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.check,
                    color: ColorsManager.whiteColor,
                  ),
                )
              ],
            ),
          ),
        );
      });
}
