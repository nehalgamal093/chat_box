import 'package:chat_box/core/resources/colors/colors_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/friends/presentation/screens/friends_screen.dart';
import 'package:chat_box/features/friends_requests/presentation/screens/friends_requests_screens.dart';
import 'package:chat_box/features/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/caching/cache_helper.dart';
import '../../../../core/common_widgets/circle_picture.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/images/images_manager.dart';
import '../../../user_profile/presentation/bloc/user_profile_bloc.dart';

class FriendsTabs extends StatelessWidget {
  const FriendsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(),),);
                },
                child: Image.asset(ImagesManager.search,width: 25,),),
            Text('Home', style: Theme.of(context).textTheme.bodyMedium),
            BlocProvider(
              create:(context)=> getIt<UserProfileBloc>()..add(GetUserProfileEvent(CacheHelper.getUserId()!)),
              child: BlocBuilder<UserProfileBloc,UserProfileState>(
                  builder: (context,state) {
                    if(state.profileStates == ProfileStates.success){
                      return CirclePicture(imageUrl: state.userProfile!.profilePicture!, radius: 20);
                    } else{
                      return CircleAvatar(backgroundColor: ColorsManager.chatColor,);
                    }
                  }
              ),
            ),
          ],
        ),

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(children: [
          FriendsScreen(),
          FriendsRequestsScreens(),
        ]),
      ),
    ));
  }
}
