import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/core/widgets/custom_text_field.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';
import 'package:techmed/features/medication/view/widgets/pick_date.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  String? _selectedMedicine;
  final TextEditingController _dosageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'addMedication',

      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Medication',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Medicine',
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
                      return 'Please select medicine';
                    }
                    return null;
                  },
                  hint: Text(
                    'Select Medicine',
                    style: AppStyles.subtitlesStyles,
                  ),
                  initialValue: _selectedMedicine,
                  items: ['Aspirin', 'Ibuprofen', 'Paracetamol']
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  onChanged: (value) =>
                      setState(() => _selectedMedicine = value!),
                ),
                const HeightSpace(16),
                Text(
                  'Dosage',
                  style: AppStyles.subtitlesStyles.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const HeightSpace(8),
                CustomTextField(
                  controller: _dosageController,
                  width: double.infinity,
                  hintText: 'e.g., 500mg, 1 tablet',
                  keyboardType: TextInputType.number,
                ),
                const HeightSpace(24),
                Text(
                  'Start Date',
                  style: AppStyles.subtitlesStyles.copyWith(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const HeightSpace(8),
                const PickDate(
                  hintText: 'Select Start Date',
                ),
                const HeightSpace(24),
                Text(
                  'End Date',
                  style: AppStyles.subtitlesStyles.copyWith(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const HeightSpace(8),
                const PickDate(
                  hintText: 'Select End Date',
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
                const CustomTextField(
                  maxLines: 5,
                  width: double.infinity,
                  hintText: 'e.g., Take with food, twice a day',
                  keyboardType: TextInputType.multiline,
                ),
                const HeightSpace(32),
                PrimayButtonWidget(
                  buttonText: 'Add Medication',
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
    );
  }
}
