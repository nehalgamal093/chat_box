import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/images/images_manager.dart';
import '../../../camera_screen/presentation/screens/camera_screen.dart';
import '../provider/file_picker_provider.dart';

toolsBottomNav(BuildContext context, String userId,FilePickerProvider provider) {

  Size size = MediaQuery.sizeOf(context);
  return showBottomSheet(
      context: context,
      sheetAnimationStyle: AnimationStyle(duration: Duration(milliseconds: 1000),reverseCurve: Curves.easeInOut,),
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: size.height * .2,
          margin: const EdgeInsets.only(bottom: 60, right: 10, left: 10),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: ColorsManager.transparentBlack,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      // chatShellProvider.changeIndex(1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CameraScreen(
                            userId: userId,
                          ),
                        ),
                      );
                    },
                    child: toolWidget(ImagesManager.camera,'Camera'),
                  ),
                  SizedBox(width: 50),
                  toolWidget(ImagesManager.mic,'Mic'),
                  SizedBox(width: 50),
                  InkWell(
                    onTap: () {
                      provider.pickFile();
                    },
                    child: toolWidget(ImagesManager.clip, 'Files'),
                  ),
                  SizedBox(width: 50),
                  toolWidget(ImagesManager.audio, 'Audio')
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  toolWidget(ImagesManager.contact,'Contact'),
                  SizedBox(width: 50),
                  toolWidget(ImagesManager.location, 'Location'),
                  SizedBox(width: 50),
                  toolWidget(ImagesManager.wallet, 'Wallet')
                ],
              ),
            ],
          ),
        );
      });
}
Widget toolWidget(String image,String title){
  return Column(
    children: [
      ImageIcon(AssetImage(image),color: ColorsManager.whiteColor,size: 30,),
      Text(title)
    ],
  );
}