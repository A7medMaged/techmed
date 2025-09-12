import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_styles.dart';

class DatePicker extends StatelessWidget {
  final DateTime? pickedDate;
  final Function(DateTime) onDatePicked;

  const DatePicker({
    super.key,
    required this.pickedDate,
    required this.onDatePicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: pickedDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
        );
        if (picked != null) {
          onDatePicked(picked);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pickedDate != null
                  ? DateFormat.yMd().format(pickedDate!)
                  : 'Select Date',
              style: AppStyles.black18BoldStyle.copyWith(
                color: pickedDate != null
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
              ),
            ),
            Icon(Icons.calendar_today, color: AppColors.primaryColor, size: 20),
          ],
        ),
      ),
    );
  }
}
