import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/core/widgets/custom_text_field.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back to TechMed',
                  style: AppStyles.primaryHeadLinesStyle,
                ),
                const HeightSpace(8),
                Text(
                  'Please fill the input below here',
                  style: AppStyles.subtitlesStyles,
                ),
                const HeightSpace(24),
                Text(
                  'E-mail',
                  style: AppStyles.subtitlesStyles,
                ),
                const HeightSpace(8),
                CustomTextField(
                  preffixIcon: Icon(
                    Icons.email,
                    color: AppColors.primaryColor,
                  ),
                  controller: emailController,
                  hintText: 'Enter your email',
                  width: double.infinity,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const HeightSpace(24),
                Text(
                  'Password',
                  style: AppStyles.subtitlesStyles,
                ),
                const HeightSpace(8),
                CustomTextField(
                  preffixIcon: Icon(
                    Icons.lock,
                    color: AppColors.primaryColor,
                  ),
                  isPassword: isObscureText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(
                      isObscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  controller: passwordController,
                  hintText: 'Enter your password',
                  width: double.infinity,
                  validator: (value) {
                    if (value == null || value.isEmpty && value.length < 6) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const HeightSpace(32),
                Center(
                  child: Column(
                    children: [
                      PrimayButtonWidget(
                        buttonText: 'Login',
                        buttonColor: AppColors.primaryColor,
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            // Perform login action
                          }
                        },
                      ),
                      const HeightSpace(8),
                      GestureDetector(
                        onTap: () => GoRouter.of(
                          context,
                        ).pushReplacement(AppRoutes.registerScreen),
                        child: Text(
                          'Don\'t have an account? Register',
                          style: AppStyles.subtitlesStyles,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
