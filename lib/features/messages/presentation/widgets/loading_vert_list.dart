import 'package:flutter/material.dart';

import '../../../../core/common_widgets/loading_list_item.dart';

class LoadingVertList extends StatelessWidget {
  const LoadingVertList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 6, left: 6),
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return LoadingListItem();
          }),
    );
  }
}
