import 'package:chat_box/core/common_widgets/circle_picture.dart';
import 'package:chat_box/features/chat/presentation/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/inherited_widgets/inherited_user.dart';
import '../../../chat/presentation/bloc/socket_bloc.dart';
import '../../data/models/chatted_users.dart';

class ChatItem extends StatelessWidget {
  final String lastMessage;
  final String time;
  const ChatItem({super.key, required this.lastMessage, required this.time});
  @override
  Widget build(BuildContext context) {
    User user = MyInheritedWidget.of(context).user;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => BlocProvider(
                  create:
                      (context) =>
                          getIt<SocketBloc>()
                            ..add(SocketConnect())
                            ..add(
                              LoadInitialMessage(
                                user.id!,
                              ),
                            ),
                  child: ChatScreen(user:user),
                ),
          ),
        );
      },
      child: ListTile(
        leading: Badge(
          backgroundColor: Colors.green,
          smallSize: 15,
          child: InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder:
              //         (context) => UserProfileScreen(
              //           id: MyInheritedWidget.of(context).user.id!,
              //         ),
              //   ),
              // );
            },
            child: CirclePicture(imageUrl:  MyInheritedWidget.of(context).user.profilePicture!, radius: 40),
          ),
        ),
        title: Text(
          MyInheritedWidget.of(context).user.fullName!,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          lastMessage,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: Column(
          children: [
            Text(
              time.substring(15, 19),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
