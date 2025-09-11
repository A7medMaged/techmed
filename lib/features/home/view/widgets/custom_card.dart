// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.onTap,
  });
  final AssetImage image;
  final String title;
  final String subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 180,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: AppColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image.assetName,
                  width: 50,
                  height: 50,
                  color: AppColors.whiteColor,
                ),
                const HeightSpace(12),
                Text(
                  title,
                  style: AppStyles.subtitlesStyles.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'View and manage your $subTitle',
                  style: AppStyles.grey12MediumStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
