import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';

class AppoinmentScreen extends StatefulWidget {
  const AppoinmentScreen({super.key});

  @override
  State<AppoinmentScreen> createState() => _AppoinmentScreenState();
}

class _AppoinmentScreenState extends State<AppoinmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Text(
              'Appoinments',
              style: AppStyles.primaryHeadLinesStyle.copyWith(
                fontSize: 24,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
      floatingActionButton: SizedBox(
        width: 165,
        height: 56,
        child: FloatingActionButton(
          heroTag: 'addAppoinment',
          onPressed: () {
            context.push(AppRoutes.addAppoinmentScreen);
          },
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: AppColors.whiteColor,
              ),
              const WidthSpace(8),
              Text(
                'Add Appoinment',
                style: AppStyles.black16w500Style.copyWith(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
