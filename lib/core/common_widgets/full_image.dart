import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullImage extends StatelessWidget {
  final String image;
  const FullImage({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: PhotoView(
          imageProvider: NetworkImage(image),
        ),
      )
    );
  }
}
