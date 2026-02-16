import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/friends/presentation/screens/friends_tabs.dart';
import 'package:chat_box/features/settings/presentation/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../core/caching/cache_helper.dart';
import '../../../../core/common_widgets/circle_picture.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/colors/colors_manager.dart';
import '../../../messages/presentation/screens/messages_screens.dart';
import '../../../search/presentation/screens/search_screen.dart';
import '../../../settings/bloc/logout_bloc/logout_bloc.dart';
import '../../../user_profile/presentation/bloc/user_profile_bloc.dart';
import '../../../user_profile/presentation/screens/user_profile_screen.dart';
import '../provider/bottom_nav_provider.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = StringsManager.mainScreenRoute;
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            child: Image.asset(
              ImagesManager.search,
              width: 25,
            ),
          ),
          Text('Home', style: Theme.of(context).textTheme.bodyLarge),
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<UserProfileBloc>()
                  ..add(GetUserProfileEvent(CacheHelper.getUserId()!)),
              ),

            ],
            child: BlocBuilder<UserProfileBloc, UserProfileState>(
              builder: (context, state) {
                if (state.profileStates == ProfileStates.success) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfileScreen(
                            id: state.userProfile!.id!,
                            isMyProfile: true,
                          ),
                        ),
                      );
                    },
                    child: CirclePicture(
                      imageUrl: state.userProfile!.profilePicture!,
                      radius: 20,
                      isMyPicture: true,
                      userId:  state.userProfile!.id!,
                    ),
                  );
                } else {
                  return CircleAvatar(
                    backgroundColor: ColorsManager.secondaryClr,
                    radius: 20,
                  );
                }
              },
            ),
          ),
        ],
      )),
      extendBody: true,
      body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<LogoutBloc>(),
            )
          ],
          child: screens[provider.index]),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
        child: BottomNavigationBar(
          currentIndex: provider.index,
          onTap: (index) {
            provider.changeIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImagesManager.chat)),
              label: StringsManager.messages,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImagesManager.user)),
              label: StringsManager.friends,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImagesManager.settings)),
              label: StringsManager.settings,
            ),
          ],
        ),
      ),
    );
  }

  final List<Widget> screens = [MessagesScreens(), FriendsTabs(), Settings()];
}
