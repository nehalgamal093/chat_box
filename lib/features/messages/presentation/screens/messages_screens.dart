import 'package:chat_box/core/di/di.dart';
import 'package:chat_box/features/friends/presentation/widgets/loading_list.dart';
import 'package:chat_box/features/messages/data/models/chatted_users.dart';
import 'package:chat_box/features/messages/presentation/bloc/chatted_users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/inherited_widgets/inherited_user.dart';
import '../widgets/chat_item.dart';

class MessagesScreens extends StatelessWidget {
  const MessagesScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 8),
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
