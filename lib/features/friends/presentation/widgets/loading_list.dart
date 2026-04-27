import 'package:chat_box/features/messages/presentation/widgets/loading_top_bar.dart';
import 'package:chat_box/features/messages/presentation/widgets/loading_vert_list.dart';
import 'package:flutter/material.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(
            width: size.width,
            height: size.height * .3,
            child: LoadingTopBar()),
        Expanded(child: LoadingVertList()),
      ],
    );
  }
}
