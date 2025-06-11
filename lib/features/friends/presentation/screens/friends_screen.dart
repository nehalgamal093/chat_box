import 'package:chat_box/features/friends/presentation/bloc/friends_bloc.dart';
import 'package:chat_box/features/friends/presentation/widgets/loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../widgets/friend_list_item.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocProvider(
          create: (context) => getIt<FriendsBloc>()..add(LoadItems()),
          child: BlocBuilder<FriendsBloc, FriendsState>(
            builder: (context, state) {
              if (state is FriendsLoading) {
                return LoadingList();
              } else if (state is FriendsLoaded) {
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return FriendListItem(dataList: state.list[index]);
                  },
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
