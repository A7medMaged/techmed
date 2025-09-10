import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/features/register/view/register_screen.dart';
import 'package:techmed/features/splash_screen/splash_screen.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        name: 'splashScreen',
        path: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: 'registerScreen',
        path: AppRoutes.registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
}
