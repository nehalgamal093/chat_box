import 'package:chat_box/core/resources/images/images_manager.dart';
import 'package:chat_box/core/resources/strings/strings_manager.dart';
import 'package:chat_box/features/friends/presentation/screens/friends_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../messages/presentation/screens/messages_screens.dart';
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
      extendBody: true,
      body: screens[provider.index],
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

  final List<Widget> screens = [
    MessagesScreens(),
    FriendsScreen(),
    Center(child: Text('Settings', style: TextStyle(color: Colors.white))),
  ];
}
