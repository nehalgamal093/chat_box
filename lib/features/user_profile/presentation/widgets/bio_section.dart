import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import 'package:chat_box/features/user_profile/presentation/bloc/user_profile_bloc.dart';
import 'package:chat_box/features/chat/presentation/provider/update_my_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'edit_bio_dialog.dart';

class BioSection extends StatefulWidget {
  final UserProfile userProfile;
  final bool isMyProfile;
  const BioSection({super.key, required this.userProfile,this.isMyProfile = false});

  @override
  State<BioSection> createState() => _BioSectionState();
}

class _BioSectionState extends State<BioSection> {
  final TextEditingController bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var myDataProvider = Provider.of<UpdateMyData>(context,listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bio'),
        SizedBox(
          height: 10,
        ),
      widget.isMyProfile?  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(myDataProvider.bio.isEmpty
                ? widget.userProfile.bio!
                : myDataProvider.bio),
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
                color: ColorsManager.lightGreen,
              ),
            ),
          ],
        ): Text(widget.userProfile.bio!),
      ],
    );
  }
}
