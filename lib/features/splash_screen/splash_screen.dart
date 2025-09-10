import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/styling/app_assets.dart';
import 'package:techmed/core/utils/dependency_injection.dart';
import 'package:techmed/core/utils/storage_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
    )..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    waitAnimationAndNavigate();
  }

  Future<void> waitAnimationAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));
    getIt<StorageHelper>().getUserToken().then((token) {
      // ignore: avoid_dynamic_calls
      if (token != null && token.isNotEmpty && mounted) {
        context.pushReplacement(AppRoutes.mainScreen);
      } else {
        // ignore: use_build_context_synchronously
        context.pushReplacement(AppRoutes.loginScreen);
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(
            AppAssets.logo,
            fit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
