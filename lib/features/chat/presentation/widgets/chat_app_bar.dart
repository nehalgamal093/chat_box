import 'package:flutter/material.dart';
import '../../../../core/resources/images/images_manager.dart';

PreferredSizeWidget chatAppBar(BuildContext context) {
  return AppBar(
    title: Row(
      children: [
        Badge(
          backgroundColor: Colors.green,
          smallSize: 10,
          child: Image.asset('assets/images/avatar2.png', width: 40),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jhon Abraham',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 16),
            ),
            Text('Active now', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ],
    ),
    centerTitle: false,
    actions: [
      ImageIcon(AssetImage(ImagesManager.call)),
      SizedBox(width: 15),
      ImageIcon(AssetImage(ImagesManager.video)),
      SizedBox(width: 20),
    ],
  );
}
