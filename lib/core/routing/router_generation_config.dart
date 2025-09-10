import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/utils/dependency_injection.dart';
import 'package:techmed/features/login/view/login_screen.dart';
import 'package:techmed/features/main/view/main_screen.dart';
import 'package:techmed/features/register/logic/cubit/register_cubit.dart';
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
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        name: 'loginScreen',
        path: AppRoutes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'mainScreen',
        path: AppRoutes.mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
    ],
  );
}
