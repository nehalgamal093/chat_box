import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class ProfileLoading extends StatelessWidget {
  const ProfileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: size.width,
          decoration: BoxDecoration(color: ColorsManager.cyan),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(backgroundColor: ColorsManager.medGrey,radius: 70,),


              SizedBox(height: 20,),
              loadingRows(),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .65,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: ColorsManager.blackColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50,),
                      Container(
                        height: 50,
                        width: size.width*.8,
                        decoration: BoxDecoration(
                            color: ColorsManager.chatColor,
                            borderRadius: BorderRadius.all(Radius.circular(10),)
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 50,
                        width: size.width*.8,
                        decoration: BoxDecoration(
                            color: ColorsManager.chatColor,
                            borderRadius: BorderRadius.all(Radius.circular(10),)
                        ),
                      )
                    ],

                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

  }
}
Widget loadingRows(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(backgroundColor: ColorsManager.medGrey,radius: 20,),
      SizedBox(width: 10,),
      CircleAvatar(backgroundColor: ColorsManager.medGrey,radius: 20,),
      SizedBox(width: 10,),
      CircleAvatar(backgroundColor: ColorsManager.medGrey,radius: 20,),
      SizedBox(width: 10,),
    ],
  );
}