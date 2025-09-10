import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:techmed/core/styling/app_assets.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 100,
      height: height ?? 100,
      child: Center(
        child: LottieBuilder.asset(AppAssets.loading, width: 400, height: 400),
      ),
    );
  }
}
