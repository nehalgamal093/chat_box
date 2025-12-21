import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:chat_box/core/di/di.dart';
import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/features/chat/presentation/screens/chat_screen.dart';
import 'package:chat_box/features/friends/presentation/widgets/loading_list.dart';
import 'package:chat_box/features/messages/data/models/chatted_users.dart';
import 'package:chat_box/features/messages/presentation/bloc/chatted_users_bloc.dart';
import 'package:chat_box/features/user_profile/presentation/bloc/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/inherited_widgets/inherited_user.dart';
import '../../../../core/resources/strings/strings_manager.dart';
import '../../../user_profile/presentation/screens/user_profile_screen.dart';
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
            create: (context) => getIt<UserProfileBloc>()
              ..add(GetUserProfileEvent(CacheHelper.getUserId()!)),
            child: BlocBuilder<UserProfileBloc, UserProfileState>(
              builder: (context, state) {
                if (state.profileStates == ProfileStates.success) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfileScreen(id: state.userProfile!.id!),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        state.userProfile!.gender == "male"
                            ? StringsManager.male
                            : StringsManager.female,
                      ),
                    ),
                  );
                } else {
                  return CircleAvatar(
                    backgroundColor: ColorsManager.chatColor,
                    radius: 30,
                  );
                }
              },
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocProvider(
          create: (context) =>
              getIt<ChattedUsersBloc>()..add(LoadChattedUsers()),
          child: BlocBuilder<ChattedUsersBloc, ChattedUsersState>(
            builder: (context, state) {
              if (state is ChattedUsersLoading) {
                return LoadingList();
              } else if (state is ChattedUsersLoaded) {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return MyInheritedWidget(
                      user: state.list[index].user!,
                      child: Builder(
                        builder: (innerContext) {
                          return ChatItem(
                            time: state.list[index].user!.updatedAt!,
                            lastMessage:
                                isPhotoOrMsg(state.list[index].lastMessage),
                          );
                        },
                      ),
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

  String isPhotoOrMsg(LastMessage? lastMessage) {
    if (lastMessage == null) {
      return "";
    } else {
      if (lastMessage.message =="") {
        if (lastMessage.mediaUrl!="") {
          return "Photo";
        } else {
          return "";
        }
      } else {
        return lastMessage.message!;
      }
    }
  }
}
