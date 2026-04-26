import 'package:chat_box/features/messages/presentation/widgets/friend_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../friends/presentation/bloc/friends_bloc.dart';
import '../../../friends/presentation/widgets/loading_list.dart';

class FriendsTopBar extends StatelessWidget {
  const FriendsTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FriendsBloc>()..add(LoadItems()),
      child: BlocBuilder<FriendsBloc, FriendsState>(
        builder: (context, state) {
          if (state is FriendsLoading) {
            return LoadingList();
          } else if (state is FriendsLoaded) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 20),
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return FriendBarItem(image:state.list[index].profilePicture!);
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    )
;
  }
}
