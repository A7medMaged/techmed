import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context,
  String message,
  AnimatedSnackBarType type,
) {
  AnimatedSnackBar.material(
    message,
    type: type,
    duration: const Duration(seconds: 3),
  ).show(context);
}
