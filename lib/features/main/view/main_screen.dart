import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/styling/app_styles.dart';
import 'package:techmed/core/utils/dependency_injection.dart';
import 'package:techmed/core/utils/storage_helper.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main Screen',
          style: AppStyles.primaryHeadLinesStyle,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              getIt<StorageHelper>().deleteUserToken();
              context.pushReplacement(AppRoutes.loginScreen);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to the Main Screen!',
          style: AppStyles.subtitlesStyles,
        ),
      ),
    );
  }
}
