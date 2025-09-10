import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/utils/animated_snack_bar.dart';
import 'package:techmed/core/utils/dependency_injection.dart';
import 'package:techmed/core/utils/storage_helper.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/core/widgets/custom_text_field.dart';
import 'package:techmed/core/widgets/language_switcher.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';
import 'package:techmed/features/auth/data/models/login_models/login_request.dart';
import 'package:techmed/features/auth/logic/login_cubit/cubit/login_cubit.dart';
import 'package:techmed/generated/l10n.dart';

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
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpace(32),
                const LanguageSwitcher(),
                Text(
                  S.of(context).wlecome_back_to_TecMed,
                  style: AppStyles.primaryHeadLinesStyle,
                ),
                const HeightSpace(8),
                Text(
                  S.of(context).please_fill_the_input_below_here,
                  style: AppStyles.subtitlesStyles,
                ),
                const HeightSpace(24),
                Text(
                  S.of(context).email,
                  style: AppStyles.subtitlesStyles,
                ),
                const HeightSpace(8),
                CustomTextField(
                  preffixIcon: Icon(
                    Icons.email,
                    color: AppColors.primaryColor,
                  ),
                  controller: emailController,
                  hintText: S.of(context).enter_your_email,
                  width: double.infinity,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).please_enter_your_email;
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
                  hintText: S.of(context).enter_your_password,
                  width: double.infinity,
                  validator: (value) {
                    if (value == null || value.isEmpty && value.length < 6) {
                      return S.of(context).please_enter_your_password;
                    }
                    return null;
                  },
                ),
                const HeightSpace(32),
                Center(
                  child: Column(
                    children: [
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginFailure) {
                            showSnackBar(
                              context,
                              state.errorMessage,
                              AnimatedSnackBarType.error,
                            );
                          } else if (state is LoginSuccess) {
                            getIt<StorageHelper>().saveUserToken(
                              state.response.data!.token!,
                            );
                            showSnackBar(
                              context,
                              state.response.message!,
                              AnimatedSnackBarType.success,
                            );
                            GoRouter.of(
                              context,
                            ).pushReplacement(AppRoutes.mainScreen);
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const CircularProgressIndicator();
                          }
                          return PrimayButtonWidget(
                            buttonText: S.of(context).login,
                            buttonColor: AppColors.primaryColor,
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                final loginRequest = LoginRequest(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                BlocProvider.of<LoginCubit>(context).login(
                                  loginRequest,
                                );
                              }
                            },
                          );
                        },
                      ),
                      const HeightSpace(8),
                      GestureDetector(
                        onTap: () => GoRouter.of(
                          context,
                        ).pushReplacement(AppRoutes.registerScreen),
                        child: Text(
                          S.of(context).dontHaveAccount,
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
