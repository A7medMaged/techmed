import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_model/datum.dart';

class VaccinationListTile extends StatelessWidget {
  const VaccinationListTile({super.key, required this.vaccination});
  final Datum vaccination;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.medical_information),
      title: Text(
        vaccination.vaccineName ?? 'Unknown Vaccination',
        style: AppStyles.primaryHeadLinesStyle,
      ),
      subtitle: Text(
        vaccination.vaccineDate != null
            ? '${vaccination.vaccineDate!.day}/${vaccination.vaccineDate!.month}/${vaccination.vaccineDate!.year}'
            : 'No date specified',
        style: AppStyles.subtitlesStyles,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        if (vaccination.id != null) {
          context.push(
            AppRoutes.vaccinationDetailsScreen,
            extra: vaccination.id!,
          );
        }
      },
    );
  }
}
