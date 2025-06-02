import 'package:chat_box/core/common_widgets/circle_icon.dart';
import 'package:chat_box/core/di/di.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:chat_box/features/user_profile/presentation/bloc/user_profile_bloc.dart';
import 'package:chat_box/features/user_profile/presentation/widgets/friend_of_user_list.dart';
import 'package:chat_box/features/user_profile/presentation/widgets/icons_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  final String id;
  const UserProfileScreen({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorsManager.cyan),
      body: BlocProvider(
        create: (context)=>getIt<UserProfileBloc>()..add(GetUserProfileEvent(id)),
        child: BlocBuilder<UserProfileBloc,UserProfileState>(
          builder: (context,state) {
           if(state.profileStates == ProfileStates.loading){
             return CircularProgressIndicator();
           } else if(state.profileStates == ProfileStates.success){
             return Stack(
               alignment: Alignment.bottomCenter,
               children: [
                 Container(
                   width: size.width,
                   decoration: BoxDecoration(color: ColorsManager.cyan),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Image.network(state.userProfile!.profilePic!, width: 80),
                       Text(state.userProfile!.fullName!),
                       Text(
                         '@${state.userProfile!.username}',
                         style: Theme.of(context).textTheme.bodySmall!.copyWith(
                           color: ColorsManager.whiteColor,
                         ),
                       ),
                       SizedBox(height: 20),
                       IconsRow(friendStatus:state.userProfile!.friendStatus! ,),
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
                             color: ColorsManager.blackColor,
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(14),
                               topRight: Radius.circular(14),
                             ),
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SizedBox(height: 20),
                               Text('Gender'),
                               Text(
                                 state.userProfile!.gender!,
                                 style: Theme.of(
                                   context,
                                 ).textTheme.bodyMedium!.copyWith(fontSize: 14),
                               ),
                               SizedBox(height: 20),
                               Text('Email'),
                               Text(
                                 'nehal@email.com',
                                 style: Theme.of(
                                   context,
                                 ).textTheme.bodyMedium!.copyWith(fontSize: 14),
                               ),
                               SizedBox(height: 20),
                               Text('Friends'),
                               SizedBox(height: 20),
                               Expanded(child: FriendsOfUserList(friends: state.userProfile!.friendsList!,)),
                             ],
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ],
             );
           } else{
             return Text('Error');
           }
          }
        ),
      ),
    );
  }
}
