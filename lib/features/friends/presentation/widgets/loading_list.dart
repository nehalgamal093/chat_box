import 'package:chat_box/core/common_widgets/loading_list_item.dart';
import 'package:flutter/material.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context,index)=>SizedBox(height: 10,),
        itemCount: 3,
        itemBuilder: (context,index){
      return LoadingListItem();
    });
  }
}
