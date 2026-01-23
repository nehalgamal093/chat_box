import 'package:chat_box/core/common_widgets/animations/staggered_animation.dart';
import 'package:chat_box/core/extensions/capitalize.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import 'package:chat_box/features/user_profile/presentation/bloc/user_profile_bloc.dart';
import 'package:chat_box/features/chat/presentation/provider/update_my_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_bio_dialog.dart';

class BioSection extends StatefulWidget {
  final User userProfile;
  final bool isMyProfile;
  const BioSection(
      {super.key, required this.userProfile, this.isMyProfile = false});

  @override
  State<BioSection> createState() => _BioSectionState();
}

class _BioSectionState extends State<BioSection> {
  final TextEditingController bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var myDataProvider = Provider.of<UpdateMyData>(context, listen: false);
    return StaggeredAnimation(
      isTitle: false,
      child: widget.isMyProfile
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StaggeredAnimation(
                      isTitle: true,
                      child: Text(
                        'Bio',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      myDataProvider.bio.isEmpty
                          ?isBioEmpty(widget.userProfile.bio!)
                          : myDataProvider.bio.capitalize(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    showEditDialog(bioController, context, () {
                      myDataProvider.changeMyBio(bioController.text);
                      context.read<UserProfileBloc>().add(ChangeMyBioEvent(
                          bioController.text, widget.userProfile.id!));
                    });
                  },
                  child: Icon(
                    Icons.edit,
                    color: ColorsManager.whiteColor,
                  ),
                ),
              ],
            )
          : Text(
              widget.userProfile.bio!.capitalize(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
    );
  }
  String isBioEmpty(String bio){
    if(bio.isEmpty||bio==null){
      return "";
    }

    return bio.capitalize();
  }
}
