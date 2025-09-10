import 'package:flutter/material.dart';
import 'package:techmed/core/routing/router_generation_config.dart';
import 'package:techmed/core/styling/theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: RouterGenerationConfig.goRouter,
    );
  }
}
