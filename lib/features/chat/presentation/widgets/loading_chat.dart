import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class LoadingChat extends StatelessWidget {
  const LoadingChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: loadingChatBubble(150,50),
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerLeft,
            child: loadingChatBubble(200,100),
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerRight,
            child: loadingChatBubble(100,50),
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerLeft,
            child: loadingChatBubble(200,50),
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerLeft,
            child: loadingChatBubble(250,150),
          ),
        ],
      )
    );
  }
}
Widget loadingChatBubble(double width, double height){
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: ColorsManager.grey03,
      borderRadius: BorderRadius.circular(15)

    ),
  );
}