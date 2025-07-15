import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class LoadingChat extends StatelessWidget {
  const LoadingChat({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context,index){
      return Align(
        alignment: index%2==0?Alignment.centerRight:Alignment.centerLeft,
        child: loadingChatBubble(),
      );
    }, separatorBuilder: (index,context)=>SizedBox(height: 10,), itemCount: 7);
  }
}
Widget loadingChatBubble(){
  return Container(
    width: 100,
    height: 50,
    decoration: BoxDecoration(
      color: ColorsManager.chatInputColor,
      borderRadius: BorderRadius.circular(15)

    ),
  );
}