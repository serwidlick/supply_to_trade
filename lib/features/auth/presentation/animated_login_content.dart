import 'package:flutter/material.dart';

/// AnimatedLoginContent class used for the login page
class AnimatedLoginContent extends StatefulWidget {
  /// Creates an instance of [AnimatedLoginContent].
  const AnimatedLoginContent({required this.child, super.key});

  /// The child widget to animate.
  /// This widget will be wrapped in fade and slide transitions.
  final Widget child;

  @override
  State<AnimatedLoginContent> createState() => _AnimatedLoginContentState();
}

class _AnimatedLoginContentState extends State<AnimatedLoginContent>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOutCubic),
    );

    // Slight delay to allow initial layout to settle before animating
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 100), () {
        _fadeController.forward();
      });
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: FadeTransition(opacity: _fadeAnimation, child: widget.child),
    );
  }
}
