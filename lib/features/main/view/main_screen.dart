import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/networking/dio_factory.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/styling/app_colors.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/utils/dependency_injection.dart';
import 'package:techmed/core/utils/storage_helper.dart';
import 'package:techmed/core/widgets/language_switcher.dart';
import 'package:techmed/features/appoinment/view/appoinment_screen.dart';
import 'package:techmed/features/home/view/home_screen.dart';
import 'package:techmed/features/medication/view/medication_screen.dart';
import 'package:techmed/generated/l10n.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: S.of(context).appTitle1,
                style: AppStyles.primaryHeadLinesStyle.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: S.of(context).appTitle2,
                style: AppStyles.primaryHeadLinesStyle,
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            onPressed: () async {
              final shouldLogout = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );

              if (shouldLogout != true) return;
              showDialog(
                // ignore: use_build_context_synchronously
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
              await getIt<StorageHelper>().deleteUserToken();
              DioFactory.removeDioHeaders();
              // ignore: use_build_context_synchronously
              context.pushReplacement(AppRoutes.loginScreen);
            },
          ),
          IconButton(
            tooltip: 'Change language',
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                fullscreenDialog: true,
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Language'),
                  content: const LanguageSwitcher(
                    color: Colors.black,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.translate_sharp,
            ),
          ),
        ],
      ),
      body: listOfWidgets[currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          // ignore: deprecated_member_use
                          ? AppColors.primaryColor.withOpacity(.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .31
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex
                                ? displayWidth * .13
                                : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex ? listOfStrings[index] : '',
                              style: AppStyles.black13BoldStyle.copyWith(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex
                                ? displayWidth * .03
                                : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == currentIndex
                                ? AppColors.primaryColor
                                // ignore: deprecated_member_use
                                : AppColors.blackColor.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.medical_information,
    Icons.calendar_month_rounded,
    Icons.person_rounded,
  ];

  List<String> get listOfStrings => [
    S.of(context).home,
    S.of(context).medication,
    S.of(context).appointments,
    S.of(context).profile,
  ];

  List<Widget> listOfWidgets = [
    const HomeScreen(),
    const MedicationScreen(),
    const AppoinmentScreen(),
    const Center(
      child: Text('Profile Screen'),
    ),
  ];
}
