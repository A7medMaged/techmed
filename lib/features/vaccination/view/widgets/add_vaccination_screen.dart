import 'package:flutter/material.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/widgets/custom_button.dart';
import 'package:techmed/core/widgets/custom_text_field.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';
import 'package:techmed/features/medication/view/widgets/pick_date.dart';

class AddVaccinationScreen extends StatefulWidget {
  const AddVaccinationScreen({super.key});

  @override
  State<AddVaccinationScreen> createState() => _AddVaccinationScreenState();
}

class _AddVaccinationScreenState extends State<AddVaccinationScreen> {
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
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            const Text('Vaccination Name'),
            const HeightSpace(8),
            const CustomTextField(
              width: double.infinity,
              hintText: 'Enter vaccination name',
              keyboardType: TextInputType.text,
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
            const PickDate(),
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
              width: double.infinity,
              hintText: 'e.g., Booster shot, annual vaccine, etc.',
              keyboardType: TextInputType.text,
              maxLines: 5,
            ),
            const HeightSpace(32),
            PrimayButtonWidget(
              width: double.infinity,
              buttonText: 'Add Vaccination',
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
