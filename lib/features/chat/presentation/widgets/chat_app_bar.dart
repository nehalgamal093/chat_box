import 'package:chat_box/core/common_widgets/circle_picture.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/images/images_manager.dart';
import '../../../user_profile/presentation/bloc/user_profile_bloc.dart';
import '../../../user_profile/presentation/screens/user_profile_screen.dart';

PreferredSizeWidget chatAppBar(BuildContext context, String id) {
  return AppBar(
    title: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfileScreen(id: id),
          ),
        );
      },
      child: BlocProvider(
        create: (context) =>
            getIt<UserProfileBloc>()..add(GetUserProfileEvent(id)),
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
          if (state.profileStates == ProfileStates.loading) {
            return SizedBox();
          } else if (state.profileStates == ProfileStates.success) {
            print('🎆🎆🎆 ID2 ${state.userProfile!.id}');
            return Row(
              children: [
            Badge(
                    backgroundColor: Colors.green,
                    smallSize: 10,
                    child: Material(
                      type: MaterialType.transparency,
                      child: CirclePicture(
                          imageUrl: state.userProfile!.profilePicture ?? "",
                          radius: 20,
                          userId: id),
                    ),
                  ),

                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.userProfile!.fullName ?? "",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 16),
                    ),
                    Text(StringsManager.activeNow,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        }),
      ),
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
