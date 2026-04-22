import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/friends/presentation/screens/friends_screen.dart';
import 'package:chat_box/features/friends_requests/presentation/screens/friends_requests_screens.dart';
import 'package:flutter/material.dart';

class FriendsTabs extends StatelessWidget {
  const FriendsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [

            TabBar(
                indicatorColor: ColorsManager.whiteColor,
                unselectedLabelColor: ColorsManager.whiteColor,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: ColorsManager.whiteColor,
                padding: const EdgeInsets.all(10),
                indicatorWeight: 2,
                dividerHeight: 0,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    child: Text(
                      StringsManager.friends,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    child: Text(
                      StringsManager.friendsRequests,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                ]),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(children: [
                  FriendsScreen(),
                  FriendsRequestsScreens(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
