import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/utils/animated_snack_bar.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/core/widgets/custom_text_field.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';
import 'package:techmed/features/auth/data/models/register_models/register_request.dart';
import 'package:techmed/features/auth/logic/register_cubit/cubit/register_cubit.dart';
import 'package:techmed/generated/l10n.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneNumberController;
  late TextEditingController nationalIdController;
  bool isObscureText = true;
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
    nationalIdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).create_your_account,
                    style: AppStyles.primaryHeadLinesStyle,
                  ),
                  const HeightSpace(8),
                  Text(
                    S.of(context).please_fill_the_input_below_here,
                    style: AppStyles.subtitlesStyles,
                  ),
                  const HeightSpace(24),
                  Text(
                    S.of(context).name,
                    style: AppStyles.subtitlesStyles,
                  ),
                  const HeightSpace(8),
                  CustomTextField(
                    preffixIcon: Icon(
                      Icons.person,
                      color: AppColors.primaryColor,
                    ),
                    controller: fullNameController,
                    hintText: S.of(context).enter_your_name,
                    width: double.infinity,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).please_enter_your_name;
                      }
                      return null;
                    },
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
                    'Phone Number',
                    style: AppStyles.subtitlesStyles,
                  ),
                  const HeightSpace(8),
                  CustomTextField(
                    preffixIcon: Icon(
                      Icons.phone,
                      color: AppColors.primaryColor,
                    ),
                    controller: phoneNumberController,
                    hintText: S.of(context).enter_your_phone,
                    width: double.infinity,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).please_enter_your_phone;
                      }
                      return null;
                    },
                  ),
                  const HeightSpace(24),
                  Text(
                    S.of(context).password,
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
                  const HeightSpace(24),
                  Text(
                    'National ID',
                    style: AppStyles.subtitlesStyles,
                  ),
                  const HeightSpace(8),
                  CustomTextField(
                    preffixIcon: Icon(
                      Icons.badge,
                      color: AppColors.primaryColor,
                    ),
                    controller: nationalIdController,
                    hintText: S.of(context).enter_your_national_id,
                    width: double.infinity,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).please_enter_your_national_id;
                      }
                      return null;
                    },
                  ),
                  const HeightSpace(24),
                  Text('Gender', style: AppStyles.subtitlesStyles),
                  const HeightSpace(8),
                  DropdownButtonFormField<String>(
                    dropdownColor: Colors.black,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    decoration: InputDecoration(
                      fillColor: AppColors.blackColor,
                      prefixIconColor: AppColors.primaryColor,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).please_enter_your_gender;
                      }
                      return null;
                    },
                    hint: Text(
                      S.of(context).select_gender,
                      style: AppStyles.subtitlesStyles,
                    ),
                    initialValue: _selectedGender,
                    items: [S.of(context).male, S.of(context).female]
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _selectedGender = value!),
                  ),
                  const HeightSpace(32),
                  Center(
                    child: Column(
                      children: [
                        BlocConsumer<RegisterCubit, RegisterState>(
                          listener: (context, state) {
                            if (state is RegisterFailure) {
                              showSnackBar(
                                context,
                                state.errorMessage,
                                AnimatedSnackBarType.error,
                              );
                            } else if (state is RegisterSuccess) {
                              showSnackBar(
                                context,
                                state.response.message!,
                                AnimatedSnackBarType.success,
                              );
                              GoRouter.of(
                                context,
                              ).pushReplacement(AppRoutes.loginScreen);
                            }
                          },
                          builder: (context, state) {
                            if (state is RegisterLoading) {
                              return const CircularProgressIndicator();
                            }
                            return PrimayButtonWidget(
                              buttonText: S.of(context).register,
                              buttonColor: AppColors.primaryColor,
                              onPress: () {
                                if (formKey.currentState!.validate()) {
                                  final RegisterRequest registerRequest =
                                      RegisterRequest(
                                        name: fullNameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phoneNumber: phoneNumberController.text,
                                        nationalId: nationalIdController.text,
                                        gender: _selectedGender,
                                      );
                                  BlocProvider.of<RegisterCubit>(
                                    context,
                                  ).register(registerRequest);
                                }
                              },
                            );
                          },
                        ),
                        const HeightSpace(8),
                        GestureDetector(
                          onTap: () => GoRouter.of(
                            context,
                          ).pushReplacement(AppRoutes.loginScreen),
                          child: Text(
                            S.of(context).alreadyHaveAccount,
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
      ),
    );
  }
}
