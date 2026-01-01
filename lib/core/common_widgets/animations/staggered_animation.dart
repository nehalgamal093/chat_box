import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

class StaggeredAnimation extends StatefulWidget {
  final bool isTitle;
  final Widget child;
  const StaggeredAnimation({super.key,required this.isTitle,required this.child});

  @override
  State<StaggeredAnimation> createState() => _StaggeredAnimationState();
}

class _StaggeredAnimationState extends State<StaggeredAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> titleAnimation;
  late Animation<double> valueAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    titleAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.5, curve: Curves.easeOut));
    valueAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isTitle? FadeTransition(
      opacity: titleAnimation,
      child: widget.child,
    ):FadeTransition(
      opacity: valueAnimation,
      child: widget.child,
    );
  }
@override
  void dispose() {
   _controller.dispose();
    super.dispose();
  }

}
