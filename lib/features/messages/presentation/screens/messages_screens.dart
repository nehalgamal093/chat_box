import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:chat_box/core/di/di.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/features/friends/presentation/widgets/loading_list.dart';
import 'package:chat_box/features/messages/presentation/bloc/chatted_users_bloc.dart';
import 'package:chat_box/features/user_profile/presentation/bloc/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/chat_item.dart';

class MessagesScreens extends StatelessWidget {
  const MessagesScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: Theme.of(context).textTheme.bodyMedium),
        actions: [
          BlocProvider(
            create:(context)=> getIt<UserProfileBloc>()..add(GetUserProfileEvent(CacheHelper.getUserId()!)),
            child: BlocBuilder<UserProfileBloc,UserProfileState>(
              builder: (context,state) {
               if(state.profileStates == ProfileStates.success){
                 return CircleAvatar(
                   radius: 15,
                   child: Image.network(state.userProfile!.profilePic!),
                 );
               } else{
                 return CircleAvatar(backgroundColor: ColorsManager.chatColor,);
               }
              }
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocProvider(
          create:
              (context) => getIt<ChattedUsersBloc>()..add(LoadChattedUsers()),
          child: BlocBuilder<ChattedUsersBloc, ChattedUsersState>(
            builder: (context, state) {
              if (state is ChattedUsersLoading) {
                return LoadingList();
              } else if (state is ChattedUsersLoaded) {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return ChatItem(
                      userId: state.list[index].user!.id!,
                      fullName: state.list[index].user!.fullName!,
                      time: state.list[index].user!.updatedAt!,
                      image: state.list[index].user!.profilePic!,
                      lastMessage:
                          state.list[index].lastMessage == null
                              ? ""
                              : state.list[index].lastMessage!.message!,
                    );
                  },
                );
              } else {
                return Text('Error');
              }
            },
          ),
        ),
      ),
    );
  }
}
