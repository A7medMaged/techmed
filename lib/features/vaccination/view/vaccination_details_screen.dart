import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/widgets/loading.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';
import 'package:techmed/features/vaccination/logic/cubit/vaccination_cubit.dart';

class VaccinationDetailsScreen extends StatefulWidget {
  const VaccinationDetailsScreen({super.key, required this.vaccinationId});
  final int vaccinationId;

  @override
  State<VaccinationDetailsScreen> createState() =>
      _VaccinationDetailsScreenState();
}

class _VaccinationDetailsScreenState extends State<VaccinationDetailsScreen> {
  @override
  void initState() {
    context.read<VaccinationCubit>().getSingleVaccination(
      widget.vaccinationId,
    );
    super.initState();
  }

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
        child: BlocBuilder<VaccinationCubit, VaccinationState>(
          builder: (context, state) {
            if (state is SingleVaccinationLoading) {
              return const Center(
                child: Loading(
                  width: 400,
                  height: 400,
                ),
              );
            } else if (state is SingleVaccinationError) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: AppStyles.subtitlesStyles.copyWith(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
              );
            }
            return Column(
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
                      state is SingleVaccinationSuccess
                          ? state.vaccination.data?.vaccineName ?? 'N/A'
                          : 'N/A',
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
                      state is SingleVaccinationSuccess
                          ? (state.vaccination.data?.vaccineDate?.toString() ??
                                'N/A')
                          : 'N/A',
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
                  state is SingleVaccinationSuccess
                      ? (state.vaccination.data?.vaccineNotes ?? 'N/A')
                      : 'N/A',
                  style: AppStyles.subtitlesStyles.copyWith(
                    fontSize: 18,
                  ),
                ),
              ],
            );
          },
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
