import 'package:flutter/material.dart';
import '../../../../core/resources/strings/strings_manager.dart';

class BoldTitle extends StatefulWidget {

  const BoldTitle({super.key});

  @override
  State<BoldTitle> createState() => _BoldTitleState();
}

class _BoldTitleState extends State<BoldTitle>  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate( CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5), // Starts 50% above its final position
      end: Offset.zero,             // Ends in its natural position
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );
    _controller.forward();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Text(
          StringsManager.easilyAndQuickly,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
