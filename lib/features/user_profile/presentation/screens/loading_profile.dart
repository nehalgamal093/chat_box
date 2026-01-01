import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/features/user_profile/presentation/widgets/loading_text.dart';
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
          decoration: BoxDecoration(color: ColorsManager.primaryColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: ColorsManager.secondaryClr,
                radius: 70,
              ),
              SizedBox(
                height: 20,
              ),
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
                    color: ColorsManager.secondaryClr,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      LoadingText(),
                      SizedBox(
                        height: 20,
                      ),
                     LoadingText(),
                      SizedBox(
                        height: 20,
                      ),
                      LoadingText()
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

Widget loadingRows() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundColor: ColorsManager.secondaryClr,
        radius: 20,
      ),
      SizedBox(
        width: 10,
      ),
      CircleAvatar(
        backgroundColor: ColorsManager.secondaryClr,
        radius: 20,
      ),
      SizedBox(
        width: 10,
      ),
      CircleAvatar(
        backgroundColor: ColorsManager.secondaryClr,
        radius: 20,
      ),
      SizedBox(
        width: 10,
      ),
    ],
  );
}
