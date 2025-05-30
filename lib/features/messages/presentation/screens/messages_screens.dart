import 'package:flutter/material.dart';
import '../widgets/chat_item.dart';

class MessagesScreens extends StatelessWidget {
  const MessagesScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',style: Theme.of(context).textTheme.bodyMedium,),
        actions: [
          CircleAvatar(
            radius: 15,
          child: Image.asset('assets/images/avatar.png'),
          ),
          SizedBox(width: 10,)
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ChatItem(userId: '1293939',);
        },
      ),
    );
  }
}
