import 'package:chat_box/core/common_widgets/circle_picture.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/features/chat/presentation/provider/file_picker_provider.dart';
import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import 'package:chat_box/features/user_profile/presentation/bloc/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/strings/strings_manager.dart';

class ProfilePicture extends StatelessWidget {
  final UserProfile userProfile;
  final String id;
  const ProfilePicture(
      {super.key, required this.userProfile, required this.id});

  @override
  Widget build(BuildContext context) {
    var pickFileProvider = Provider.of<FilePickerProvider>(context);
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        CirclePicture(imageUrl: userProfile.profilePicture!,radius: 50,),
        InkWell(
            onTap: () {
              pickFileProvider.pickFile(onPicked: () {
                updateProfile(context, pickFileProvider.file.path, id);
              });
            },
            child: Icon(
              Icons.camera_alt,
              color: ColorsManager.darkBlue,
            ))
      ],
    );
  }

  void updateProfile(BuildContext context, String file, String id) {
    context.read<UserProfileBloc>().add(ChangeMyPhotoEvent(file, id));
  }
}
