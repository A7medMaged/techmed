import 'package:flutter/material.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';

class VaccinationDetailsScreen extends StatefulWidget {
  const VaccinationDetailsScreen({super.key});

  @override
  State<VaccinationDetailsScreen> createState() =>
      _VaccinationDetailsScreenState();
}

class _VaccinationDetailsScreenState extends State<VaccinationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vaccination Details',
          style: AppStyles.subtitlesStyles.copyWith(
            fontSize: 24,
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vaccination Name:',
              style: AppStyles.subtitlesStyles.copyWith(
                fontSize: 24,
                color: AppColors.whiteColor,
              ),
            ),
            const HeightSpace(8),
            Row(
              children: [
                const Icon(
                  Icons.medical_information,
                  size: 24,
                  color: Colors.white,
                ),
                const WidthSpace(12),
                Text(
                  'Covid-19',
                  style: AppStyles.subtitlesStyles.copyWith(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const HeightSpace(16),
            Text(
              'Vaccination Date:',
              style: AppStyles.subtitlesStyles.copyWith(
                fontSize: 24,
                color: AppColors.whiteColor,
              ),
            ),
            const HeightSpace(8),
            Row(
              children: [
                const Icon(
                  Icons.date_range,
                  size: 24,
                  color: Colors.white,
                ),
                const WidthSpace(12),
                Text(
                  '12/12/2023',
                  style: AppStyles.subtitlesStyles.copyWith(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const HeightSpace(16),
            Text(
              'Notes:',
              style: AppStyles.subtitlesStyles.copyWith(
                fontSize: 24,
                color: AppColors.whiteColor,
              ),
            ),
            const HeightSpace(8),
            Text(
              'This is a note about the vaccination.',
              style: AppStyles.subtitlesStyles.copyWith(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 130,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              const WidthSpace(8),
              Text(
                'Delete',
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
