import 'package:flutter/material.dart';
import 'package:techmed/core/styling/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final double? width;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final bool enable;
  final int maxLines;
  const CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.preffixIcon,
    this.width,
    this.isPassword,
    this.controller,
    this.validator,
    this.keyboardType,
    this.onTap,
    this.enable = true,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331,
      child: TextFormField(
        maxLines: maxLines,
        enabled: enable,
        onTap: onTap,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        obscureText: isPassword ?? false,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          hintText: hintText ?? "",
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color(0xff8391A1),
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xffE8ECF4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red),
          ),
          filled: true,
          fillColor: const Color(0xffF7F8F9),
          suffixIcon: suffixIcon,
          prefixIcon: preffixIcon,
        ),
      ),
    );
  }
}
