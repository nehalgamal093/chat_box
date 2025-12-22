import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import 'package:chat_box/features/user_profile/presentation/bloc/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BioSection extends StatelessWidget {
  final UserProfile userProfile;
  const BioSection({super.key,required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bio'),
        SizedBox(height: 10,),
        TextField(

          decoration: InputDecoration(
            hintText: userProfile.bio,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:Colors.white,)
            )
          ),
          onChanged: (val){

            context.read<UserProfileBloc>().add(ChangeMyBioEvent(val, userProfile.id!));
          },
        )
      ],
    );
  }
}
