import 'package:chat_box/core/common_widgets/circle_picture.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/fonts/custom_fonts.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/chat/presentation/widgets/active_now.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/images/images_manager.dart';
import '../../../user_profile/presentation/bloc/user_profile_bloc.dart';
import '../../../user_profile/presentation/screens/user_profile_screen.dart';

PreferredSizeWidget chatAppBar(BuildContext context, String id) {
  return AppBar(
    toolbarHeight: 80,
    backgroundColor: ColorsManager.grey03,
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
            return Row(
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: CirclePicture(
                      imageUrl: state.userProfile!.profilePicture ?? "",
                      radius: 20,
                      userId: id),
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
                    SizedBox(
                      height: 5,
                    ),
                    ActiveNow()
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
