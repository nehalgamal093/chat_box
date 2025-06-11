import 'package:chat_box/core/di/di.dart';
import 'package:chat_box/features/friends/presentation/widgets/loading_list.dart';
import 'package:chat_box/features/friends_requests/presentation/bloc/friend_requests_bloc/friend_requests_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/friend_request_item.dart';

class FriendsRequestsScreens extends StatelessWidget {
  const FriendsRequestsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create:
            (context) => getIt<FriendRequestsBloc>()..add(LoadFriendRequests()),
        child: BlocBuilder<FriendRequestsBloc, FriendRequestsState>(
          builder: (context, state) {
            if (state is FriendRequestsLoading) {
              return LoadingList();
            } else if (state is FriendRequestsLoaded) {
              return ListView.separated(
                itemCount: state.list.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return FriendRequestItem(dataList: state.list[index],status: state.status,);
                },
              );
            } else {
              return Text('Error');
            }
          },
        ),
      ),
    );
  }
}
