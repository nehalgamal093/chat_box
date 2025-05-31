import 'package:flutter/material.dart';
import '../../../../core/resources/images/images_manager.dart';

PreferredSizeWidget chatAppBar(BuildContext context,String fullName,String image) {
  return AppBar(
    title: Row(
      children: [
        Badge(
          backgroundColor: Colors.green,
          smallSize: 10,
          child: Image.network(image, width: 40),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullName,
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
