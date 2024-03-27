import 'package:bookly_app/Features/Splash/presentation/views/widgets/logo_sliding_animation.dart';
import 'package:bookly_app/Features/Splash/presentation/views/widgets/text_sliding_animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController logoAnimationController, textAnimationController;
  late Animation<Offset> logoSlidingAnimation, textSlidingAnimation;

  @override
  void initState() {
    initSlidingAnimation();
    navigateToHomeView();
    super.initState();
  }

  @override
  void dispose() {
    logoAnimationController.dispose();
    textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LogoSlidingAnimation(
          logoSlidingAnimation: logoSlidingAnimation,
        ),
        const SizedBox(
          height: 4,
        ),
        TextSlidingAnimation(
          textSlidingAnimation: textSlidingAnimation,
        ),
      ],
    );
  }

  void initSlidingAnimation() {
    logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    logoSlidingAnimation = Tween<Offset>(
      begin: const Offset(0, -5),
      end: Offset.zero,
    ).animate(logoAnimationController);

    textSlidingAnimation = Tween<Offset>(
      begin: const Offset(0, 5),
      end: Offset.zero,
    ).animate(textAnimationController);

    logoAnimationController.forward();
    textAnimationController.forward();
  }

  void navigateToHomeView() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).push('/homeView');
      },
    );
  }
}
