import 'package:chat_box/features/chat/presentation/screens/chat_screen.dart';
import 'package:chat_box/features/user_profile/presentation/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String userId;
  final String image;
  final String lastMessage;
  final String time;
  final String fullName;
  const ChatItem({
    super.key,
    required this.userId,
    required this.image,
    required this.lastMessage,
    required this.time,
    required this.fullName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ChatScreen(
                  userId: userId,
                  fullName: fullName,
                  image: image,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfileScreen(id: userId),
                ),
              );
            },
            child: Image.network(image),
          ),
        ),
        title: Text(fullName, style: Theme.of(context).textTheme.bodyMedium),
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
