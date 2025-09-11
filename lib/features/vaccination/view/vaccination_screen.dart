import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';

class VaccinationScreen extends StatefulWidget {
  const VaccinationScreen({super.key});

  @override
  State<VaccinationScreen> createState() => _VaccinationScreenState();
}

class _VaccinationScreenState extends State<VaccinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vaccinations',
          style: AppStyles.subtitlesStyles.copyWith(
            fontSize: 24,
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text('Vaccination Screen'),
      ),
      floatingActionButton: SizedBox(
        width: 165,
        height: 56,
        child: FloatingActionButton(
          heroTag: 'addVaccination',
          onPressed: () {
            context.push(AppRoutes.addVaccinationScreen);
          },
          backgroundColor: AppColors.primaryColor,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add, color: Colors.white),
              const WidthSpace(8),
              Text(
                'Add Vaccination',
                style: AppStyles.subtitlesStyles.copyWith(
                  fontSize: 16,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
