import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/core/widgets/custom_text_field.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';
import 'package:techmed/features/appoinment/view/widgets/pick_time.dart';
import 'package:techmed/features/medication/view/widgets/pick_date.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({super.key});

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  String? _selectedDoctor;
  String? _selectedHospital;
  final TextEditingController _statusController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'addAppoinment',
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Appointment',
            style: AppStyles.primaryHeadLinesStyle.copyWith(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            onPressed: context.pop,
            icon: const Icon(
              Icons.close,
              size: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: AppStyles.subtitlesStyles.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const HeightSpace(8),
                  CustomTextField(
                    controller: _statusController,
                    width: double.infinity,
                    hintText: 'Enter your status',
                    keyboardType: TextInputType.text,
                  ),
                  const HeightSpace(16),
                  Text(
                    'Date',
                    style: AppStyles.subtitlesStyles.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const HeightSpace(8),
                  const PickDate(
                    hintText: 'Select appointment Date',
                  ),
                  const HeightSpace(24),
                  Text(
                    'Time',
                    style: AppStyles.subtitlesStyles.copyWith(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                  const HeightSpace(8),
                  const PickTime(),
                  const HeightSpace(24),
                  Text(
                    'Doctor Name',
                    style: AppStyles.subtitlesStyles.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
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
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select doctor';
                      }
                      return null;
                    },
                    hint: Text(
                      'Select Doctor',
                      style: AppStyles.subtitlesStyles,
                    ),
                    initialValue: _selectedDoctor,
                    items: ['Dr. Smith', 'Dr. Johnson', 'Dr. Brown']
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _selectedDoctor = value!),
                  ),
                  const HeightSpace(24),
                  Text(
                    'Hospital Name',
                    style: AppStyles.subtitlesStyles.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
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
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select hospital';
                      }
                      return null;
                    },
                    hint: Text(
                      'Select Hospital',
                      style: AppStyles.subtitlesStyles,
                    ),
                    initialValue: _selectedHospital,
                    items: ['Hospital A', 'Hospital B', 'Hospital C']
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _selectedHospital = value!),
                  ),
                  const HeightSpace(32),
                  PrimayButtonWidget(
                    buttonText: 'Add Appointment',
                    onPress: () {},
                    width: double.infinity,
                    height: 56,
                    bordersRadius: 12,
                    fontSize: 22,
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
