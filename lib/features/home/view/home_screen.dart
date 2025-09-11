import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/styling/app_assets.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/utils/animated_snack_bar.dart';
import 'package:techmed/core/widgets/spacing_widgets.dart';
import 'package:techmed/features/home/view/widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCard(
                  image: const AssetImage(AppAssets.prescription),
                  title: 'Prescriptions',
                  subTitle: 'Medications',
                  onTap: () {
                    setState(() {
                      showSnackBar(
                        context,
                        'Tapped',
                        AnimatedSnackBarType.warning,
                      );
                    });
                  },
                ),
                const WidthSpace(8),
                CustomCard(
                  image: const AssetImage(AppAssets.injection),
                  title: 'Vaccinations',
                  subTitle: 'vaccinations',
                  onTap: () {
                    context.push(AppRoutes.vaccinationScreen);
                  },
                ),
              ],
            ),
            const HeightSpace(32),
            Text(
              'Today\'s Medications',
              style: AppStyles.subtitlesStyles.copyWith(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
