import 'package:chat_box/features/user_profile/presentation/bloc/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common_widgets/circle_icon.dart';
import '../../../../core/resources/colors/colors_manager.dart';
import '../../../../core/resources/images/images_manager.dart';

class IconsRow extends StatelessWidget {
  final String friendStatus;
  final String id;
  const IconsRow({super.key, required this.friendStatus,required this.id});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleIcon(icon: Image.asset( ImagesManager.chat,color: ColorsManager.whiteColor,width: 25,)),
        SizedBox(width: 30),
        CircleIcon(icon: Image.asset( ImagesManager.video,color: ColorsManager.whiteColor,width: 25,)),
        SizedBox(width: 30),
        CircleIcon(icon:Image.asset( ImagesManager.call,color: ColorsManager.whiteColor,width: 25,)),
        SizedBox(width: 30),
        getFriendStatus(friendStatus,context),
      ],
    );
  }

  Widget getFriendStatus(String status,BuildContext context) {
    print('status----> $status');
    switch (status) {
      case 'friends':
        return InkWell(
          onTap: () {
            print("-----------> friends");
          },
          child: CircleIcon(icon:Image.asset( ImagesManager.friends,color: ColorsManager.whiteColor,width: 25,)),
        );
      case 'sent':
        return InkWell(
          onTap: () {
            print("-----------> sent");
            context.read<UserProfileBloc>().add(CancelFriendRequestEvent(id));

          },
          child: CircleIcon(icon:Image.asset( ImagesManager.friendsPending,width: 25,)),
        );
      default:
        return InkWell(
          onTap: () {
            print("-----------> cancel");
            context.read<UserProfileBloc>().add(SendFriendRequestEvent(id));
          },
          child: CircleIcon(icon:Image.asset( ImagesManager.friendRequest,color: ColorsManager.whiteColor,width: 25,)),
        );
    }
  }
}
