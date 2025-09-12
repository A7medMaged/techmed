import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';
import 'package:techmed/features/vaccination/logic/cubit/vaccination_cubit.dart';
import 'package:techmed/features/vaccination/view/widgets/vaccination_list_tile.dart';

class VaccinationScreen extends StatefulWidget {
  const VaccinationScreen({super.key});

  @override
  State<VaccinationScreen> createState() => _VaccinationScreenState();
}

class _VaccinationScreenState extends State<VaccinationScreen> {
  @override
  void initState() {
    super.initState();
    // Load vaccinations when screen loads
    context.read<VaccinationCubit>().getVaccinations();
  }

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<VaccinationCubit, VaccinationState>(
                  buildWhen: (previous, current) {
                    return current is VaccinationLoading ||
                        current is VaccinationSuccess ||
                        current is VaccinationError;
                  },
                  builder: (context, state) {
                    if (state is VaccinationLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is VaccinationSuccess) {
                      if (state.vaccinations.data == null ||
                          state.vaccinations.data!.isEmpty) {
                        return Center(
                          child: Text(
                            "No vaccinations found",
                            style: AppStyles.primaryHeadLinesStyle,
                          ),
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () => BlocProvider.of<VaccinationCubit>(
                          context,
                        ).getVaccinations(),
                        child: ListView.builder(
                          itemCount: state.vaccinations.data!.length,
                          itemBuilder: (context, index) {
                            final vaccination = state.vaccinations.data![index];
                            return VaccinationListTile(
                              vaccination: vaccination,
                            );
                          },
                        ),
                      );
                    } else if (state is VaccinationError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Error loading vaccinations:',
                              style: AppStyles.primaryHeadLinesStyle.copyWith(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.errorMessage,
                              style: AppStyles.primaryHeadLinesStyle.copyWith(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<VaccinationCubit>()
                                    .getVaccinations();
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    }

                    return Center(
                      child: Text(
                        "unknown state",
                        style: AppStyles.primaryHeadLinesStyle,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 165,
        height: 56,
        child: FloatingActionButton(
          heroTag: 'addVaccination',
          onPressed: () {
            context.push(AppRoutes.addVaccinationScreen).then((value) {
              if (value == true) {
                // ignore: use_build_context_synchronously
                BlocProvider.of<VaccinationCubit>(context).getVaccinations();
              }
            });
          },
          backgroundColor: AppColors.primaryColor,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                color: Colors.white,
              ),
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
