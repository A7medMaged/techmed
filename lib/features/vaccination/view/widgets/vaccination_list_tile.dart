import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/styling/app_styles.dart';

class VaccinationListTile extends StatelessWidget {
  const VaccinationListTile({super.key, required this.vaccination});
  final dynamic vaccination;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.vaccinationDetailsScreen);
      },
      child: ListTile(
        leading: const Icon(Icons.medical_information),
        title: Text(
          // ignore: avoid_dynamic_calls
          vaccination.vaccineName ?? 'Unknown Vaccination',
          style: AppStyles.primaryHeadLinesStyle,
        ),
        subtitle: Text(
          // ignore: avoid_dynamic_calls
          vaccination.vaccineDate != null
              // ignore: avoid_dynamic_calls
              ? '${vaccination.vaccineDate!.day}/${vaccination.vaccineDate!.month}/${vaccination.vaccineDate!.year}'
              : 'No date specified',
          style: AppStyles.subtitlesStyles,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          context.push(AppRoutes.vaccinationDetailsScreen);
        },
      ),
    );
  }
}
