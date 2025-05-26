import 'package:chat_box/features/chat/presentation/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ChatScreen.routeName);
      },
      child: ListTile(
        leading: Badge(
          backgroundColor: Colors.green,
          smallSize: 15,
          child: Image.asset('assets/images/avatar.png'),
        ),
        title: Text(
          'Alex Linderson',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          'How are you?',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: Column(
          children: [
            Text('2 mins ago', style: Theme.of(context).textTheme.bodySmall),
            Spacer(),
            Badge(
              label: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text('1'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
