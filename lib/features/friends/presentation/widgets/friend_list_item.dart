import 'package:chat_box/core/common_widgets/custom_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/colors/colors_manager.dart';
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
              border: Border.all(color: ColorsManager.medGrey),
              borderRadius: BorderRadius.circular(20)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(profilePicture:  dataList.profilePicture??""),
              // CirclePicture(imageUrl: dataList.profilePicture!,radius: 40,userId: dataList.id!,),
              SizedBox(width: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dataList.fullName!,style: Theme.of(context).textTheme.bodyMedium,),
                  Text("@laila",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorsManager.medGrey),),
                  SizedBox(height: 5),
                  Text("This my new account",style: Theme.of(context).textTheme.bodyMedium,),
                  SizedBox(height: 5),
                  Text(
                    dataList.bio!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
