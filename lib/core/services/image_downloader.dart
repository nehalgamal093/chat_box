import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:saver_gallery/saver_gallery.dart';
import 'package:uuid/uuid.dart';

class ImageDownloader{
  static Future<void> saveGif(String imageUrl) async {
    var response = await Dio().get(
      imageUrl,
      options: Options(responseType: ResponseType.bytes),
    );

    var uuid = Uuid();
    final result = await SaverGallery.saveImage(
      Uint8List.fromList(response.data),
      quality: 60,
      androidRelativePath: "Pictures",
      skipIfExists: false, fileName:uuid.v1() ,
    );

  }
}