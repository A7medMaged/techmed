import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techmed/core/widgets/custom_text_field.dart';

class PickDate extends StatefulWidget {
  const PickDate({super.key});

  @override
  State<PickDate> createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  final TextEditingController _dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: _dateInput,
      width: double.infinity,
      hintText: 'Select Start Date',
      suffixIcon: const Icon(Icons.calendar_today),
      isPassword: false,
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          final String formattedDate = DateFormat(
            'yyyy/MM/dd',
          ).format(pickedDate);
          setState(() {
            _dateInput.text = formattedDate;
          });
        }
      },
    );
  }
}
