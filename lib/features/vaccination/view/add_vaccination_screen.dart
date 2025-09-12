import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/utils/animated_snack_bar.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/core/widgets/custom_text_field.dart';
import 'package:techmed/core/widgets/date_picker.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_request.dart';
import 'package:techmed/features/vaccination/logic/cubit/vaccination_cubit.dart';

class AddVaccinationScreen extends StatefulWidget {
  const AddVaccinationScreen({super.key});

  @override
  State<AddVaccinationScreen> createState() => _AddVaccinationScreenState();
}

class _AddVaccinationScreenState extends State<AddVaccinationScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _vaccinationNameController = TextEditingController();
  TextEditingController _notesController = TextEditingController();
  DateTime? pickedVaccinationDate;

  @override
  void dispose() {
    _vaccinationNameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Vaccination',
          style: AppStyles.subtitlesStyles.copyWith(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.close,
            size: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Hero(
        tag: 'addVaccinationHero',
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vaccination Name',
                    style: AppStyles.subtitlesStyles.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const HeightSpace(8),
                  CustomTextField(
                    controller: _vaccinationNameController,
                    width: double.infinity,
                    hintText: 'Enter vaccination name',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a vaccination name';
                      }
                      return null;
                    },
                  ),
                  const HeightSpace(24),
                  Text(
                    'Vaccination Date',
                    style: AppStyles.subtitlesStyles.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const HeightSpace(8),
                  DatePicker(
                    pickedDate: pickedVaccinationDate,
                    onDatePicked: (date) {
                      setState(() {
                        pickedVaccinationDate = date;
                      });
                    },
                  ),
                  const HeightSpace(24),
                  Text(
                    'Notes',
                    style: AppStyles.subtitlesStyles.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const HeightSpace(8),
                  CustomTextField(
                    controller: _notesController,
                    width: double.infinity,
                    hintText: 'e.g., Booster shot, annual vaccine, etc.',
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a note';
                      }
                      return null;
                    },
                  ),
                  const HeightSpace(32),
                  BlocConsumer<VaccinationCubit, VaccinationState>(
                    listenWhen: (previous, current) {
                      return current is CreateVaccinationSuccess ||
                          current is CreateVaccinationError;
                    },
                    listener: (context, state) {
                      if (state is CreateVaccinationSuccess) {
                        if (mounted) {
                          showSnackBar(
                            context,
                            'Vaccination added successfully',
                            AnimatedSnackBarType.success,
                          );
                          context.pop(true);
                        }
                      } else if (state is CreateVaccinationError) {
                        showSnackBar(
                          context,
                          state.errorMessage,
                          AnimatedSnackBarType.error,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is CreateVaccinationLoading) {
                        return const CircularProgressIndicator();
                      }
                      return PrimayButtonWidget(
                        width: double.infinity,
                        buttonText: 'Add Vaccination',
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            if (pickedVaccinationDate == null) {
                              showSnackBar(
                                context,
                                'Please select a vaccination date',
                                AnimatedSnackBarType.error,
                              );
                              return;
                            } else {
                              final VaccinationRequest vaccinationRequest =
                                  VaccinationRequest(
                                    vaccineName:
                                        _vaccinationNameController.text,
                                    vaccineDate: pickedVaccinationDate!,
                                    vaccineNotes: _notesController.text,
                                  );
                              BlocProvider.of<VaccinationCubit>(
                                context,
                              ).addVaccination(vaccinationRequest);
                            }
                          }
                        },
                      );
                    },
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
