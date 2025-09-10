import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.pushReplacement(AppRoutes.loginScreen);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Main Screen!'),
      ),
    );
  }
}
