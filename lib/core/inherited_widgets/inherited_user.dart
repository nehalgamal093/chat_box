import 'package:flutter/material.dart';
import '../../features/messages/data/models/chatted_users.dart';

class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget({super.key, required this.child, required this.user})
    : super(child: child);
  final Widget child;
  final User user;

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return false;
  }
}
