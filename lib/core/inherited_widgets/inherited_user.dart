import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget({super.key, required this.child, required this.userId})
    : super(child: child);
  final Widget child;
  final String userId;

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return false;
  }
}
