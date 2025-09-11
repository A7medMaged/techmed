import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:techmed/core/routing/app_routes.dart';
import 'package:techmed/core/utils/dependency_injection.dart';
import 'package:techmed/features/appoinment/view/widgets/add_appointment_screen.dart';
import 'package:techmed/features/auth/logic/login_cubit/cubit/login_cubit.dart';
import 'package:techmed/features/auth/view/login_screen.dart';
import 'package:techmed/features/main/view/main_screen.dart';
import 'package:techmed/features/auth/logic/register_cubit/cubit/register_cubit.dart';
import 'package:techmed/features/auth/view/register_screen.dart';
import 'package:techmed/features/medication/view/widgets/add_medication_screen.dart';
import 'package:techmed/features/splash_screen/splash_screen.dart';
import 'package:techmed/features/vaccination/view/vaccination_screen.dart';
import 'package:techmed/features/vaccination/view/widgets/add_vaccination_screen.dart';

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
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        name: 'mainScreen',
        path: AppRoutes.mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        name: 'addMedicationScreen',
        path: AppRoutes.addMedicationScreen,
        builder: (context, state) => const AddMedicationScreen(),
      ),
      GoRoute(
        name: 'addAppoinmentScreen',
        path: AppRoutes.addAppoinmentScreen,
        builder: (context, state) => const AddAppointmentScreen(),
      ),
      GoRoute(
        name: 'vaccinationScreen',
        path: AppRoutes.vaccinationScreen,
        builder: (context, state) => const VaccinationScreen(),
      ),
      GoRoute(
        name: 'addVaccinationScreen',
        path: AppRoutes.addVaccinationScreen,
        builder: (context, state) => const AddVaccinationScreen(),
      ),
    ],
  );
}
