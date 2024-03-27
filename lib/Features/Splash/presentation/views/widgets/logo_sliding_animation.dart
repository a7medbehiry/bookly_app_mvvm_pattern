import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class LogoSlidingAnimation extends StatelessWidget {
  const LogoSlidingAnimation({
    super.key,
    required this.logoSlidingAnimation,
  });

  final Animation<Offset> logoSlidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: logoSlidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: logoSlidingAnimation,
            child: Image.asset(AssetsData.logo),
          );
        });
  }
}
