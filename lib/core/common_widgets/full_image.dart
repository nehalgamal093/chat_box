import 'package:chat_box/core/services/image_downloader.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullImage extends StatelessWidget {
  final String image;
  const FullImage({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             IconButton(onPressed: (){
               ImageDownloader.saveGif(image);
             }, icon: Icon(Icons.arrow_downward,color: Colors.white,)),
              SizedBox(
                width: size.width,
                height: size.height*.6,
                child: PhotoView(
                  imageProvider: NetworkImage(image),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
