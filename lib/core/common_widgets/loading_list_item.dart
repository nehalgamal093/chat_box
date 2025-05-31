import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class LoadingListItem extends StatelessWidget {
  const LoadingListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: ColorsManager.chatColor,
            borderRadius: BorderRadius.all(Radius.circular(2))
          ),
        ),
        SizedBox(width: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 20,
              decoration: BoxDecoration(
                  color: ColorsManager.chatColor,
                  borderRadius: BorderRadius.all(Radius.circular(2))
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 100,
              height: 20,
              decoration: BoxDecoration(
                  color: ColorsManager.chatColor,
                  borderRadius: BorderRadius.all(Radius.circular(2))
              ),
            ),
          ],
        )
      ],
    );
  }
}
