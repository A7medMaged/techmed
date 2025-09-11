import 'package:flutter/material.dart';
import 'package:techmed/core/widgets/custom_text_field.dart';

class PickTime extends StatefulWidget {
  const PickTime({super.key});

  @override
  State<PickTime> createState() => _PickTimeState();
}

class _PickTimeState extends State<PickTime> {
  final TextEditingController _timeInput = TextEditingController();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
      // ignore: use_build_context_synchronously
      _timeInput.text = _selectedTime.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: _timeInput,
      width: double.infinity,
      hintText: 'Select Appointment Time',
      suffixIcon: const Icon(Icons.calendar_today),
      isPassword: false,
      onTap: () {
        _selectTime(context);
      },
    );
  }
}
