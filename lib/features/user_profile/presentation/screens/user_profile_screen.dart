import 'package:chat_box/core/common_widgets/animations/staggered_animation.dart';
import 'package:chat_box/core/di/di.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/features/user_profile/presentation/bloc/user_profile_bloc.dart';
import 'package:chat_box/features/user_profile/presentation/widgets/bio_section.dart';
import 'package:chat_box/features/user_profile/presentation/widgets/friend_of_user_list.dart';
import 'package:chat_box/features/user_profile/presentation/widgets/icons_row.dart';
import 'package:chat_box/features/user_profile/presentation/widgets/profile_picture.dart';
import 'package:chat_box/features/user_profile/presentation/widgets/qr_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/capitalize.dart';
import 'loading_profile.dart';

class UserProfileScreen extends StatelessWidget {
  final String id;
  final bool isMyProfile;
  const UserProfileScreen(
      {super.key, required this.id, this.isMyProfile = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorsManager.primaryColor),
      body: BlocProvider(
        create: (context) =>
            getIt<UserProfileBloc>()..add(GetUserProfileEvent(id)),
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            if (state.profileStates == ProfileStates.loading) {
              return ProfileLoading();
            } else if (state.profileStates == ProfileStates.success) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: size.width,
                    decoration:
                        BoxDecoration(color: ColorsManager.primaryColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfilePicture(
                          userProfile: state.userProfile!,
                          id: state.userProfile!.id!,
                          isMyProfile: isMyProfile,
                        ),
                        StaggeredAnimation(
                            isTitle: true,
                            child: Text(
                              state.userProfile!.fullName!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                        StaggeredAnimation(
                          isTitle: false,
                          child: Text(
                            '@${state.userProfile!.username}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: 20),
                        IconsRow(
                          friendStatus: state.status!,
                          id: state.userProfile!.id!,
                        ),
                        SizedBox(height: 20),
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
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        StaggeredAnimation(
                                            isTitle: true,
                                            child: Text(
                                              'Gender',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),),
                                        StaggeredAnimation(
                                          isTitle: false,
                                          child: Text(
                                            state.userProfile!.gender!
                                                .capitalize(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        qrView(context, id);
                                      },
                                      icon: Icon(
                                        Icons.qr_code_2,
                                        color: ColorsManager.whiteColor,
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                StaggeredAnimation(
                                    isTitle: true,
                                    child: Text(
                                      'Email',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )),
                                StaggeredAnimation(
                                  isTitle: false,
                                  child: Text(
                                    'nehal@email.com',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                SizedBox(height: 20),
                                // BioSection(
                                //   userProfile: state.userProfile!,
                                //   isMyProfile: isMyProfile,
                                // ),
                                SizedBox(height: 20),
                                StaggeredAnimation(
                                    isTitle: true,
                                    child: Text(
                                      'Friends',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )),
                                SizedBox(height: 20),
                                Expanded(
                                  child: StaggeredAnimation(
                                    isTitle: false,
                                    child: FriendsOfUserList(
                                      friends: state.userProfile!.friendsList!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Text('Error');
            }
          },
        ),
      ),
    );
  }
}
