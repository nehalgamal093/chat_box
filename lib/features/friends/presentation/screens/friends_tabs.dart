import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/features/friends/presentation/screens/friends_screen.dart';
import 'package:chat_box/features/friends_requests/presentation/screens/friends_requests_screens.dart';
import 'package:flutter/material.dart';

class FriendsTabs extends StatelessWidget {
  const FriendsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(
            indicatorColor: ColorsManager.whiteColor,
            unselectedLabelColor: ColorsManager.whiteColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor:ColorsManager.whiteColor,

            padding: const EdgeInsets.all(10),
            indicatorWeight: 2,
            indicator: BoxDecoration(
              color: ColorsManager.cyan,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            dividerHeight: 0,
            tabs: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Friends'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Friends Requests'),
          )
        ]),
      ),
      body: TabBarView(children: [
        FriendsScreen(),
        FriendsRequestsScreens(),
      ]),
    ));
  }
}
