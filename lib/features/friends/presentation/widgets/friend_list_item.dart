import 'package:chat_box/core/common_widgets/circle_picture.dart';
import 'package:chat_box/core/common_widgets/custom_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/colors/colors_manager.dart';
import '../../../../core/resources/fonts/custom_fonts.dart';
import '../../../user_profile/presentation/screens/user_profile_screen.dart';
import '../../data/models/friends.dart';

class FriendListItem extends StatelessWidget {
  final DataList dataList;
  const FriendListItem({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfileScreen(id: dataList.id!),
          ),
        );
      },
      child: Center(
        child: Container(
          width: size.width*.8,
          decoration: BoxDecoration(
              color: ColorsManager.grey00,
              borderRadius: BorderRadius.circular(22)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CirclePicture(imageUrl:  dataList.profilePicture??"", radius: 40, userId: dataList.id!,),
                SizedBox(width: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dataList.fullName!,style: CustomFonts.med02(fontColor: ColorsManager.whiteColor)),
                    Text("@laila",style: CustomFonts.small00(fontColor: ColorsManager.grey02)),
                    SizedBox(height: 10),
                    Text("This my new account",style:CustomFonts.med02(fontColor: ColorsManager.whiteColor)),
                    SizedBox(height: 5),
                    Text(
                      dataList.bio!,
                      style: CustomFonts.med00(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
