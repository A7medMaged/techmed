import 'package:get_it/get_it.dart';
import 'package:techmed/core/networking/dio_helper.dart';
import 'package:techmed/features/login/data/repos/login_repo.dart';
import 'package:techmed/features/login/logic/cubit/login_cubit.dart';
import 'package:techmed/features/register/data/repos/register_repo.dart';
import 'package:techmed/features/register/logic/cubit/register_cubit.dart';

GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  final DioHelper diohelper = DioHelper();

  //  Dio
  getIt.registerLazySingleton<DioHelper>(() => diohelper);

  // Reops
  getIt.registerLazySingleton(
    () => RegisterRepo(getIt<DioHelper>()),
  );

  getIt.registerLazySingleton(
    () => LoginRepo(getIt<DioHelper>()),
  );

  // Cubits
  getIt.registerFactory(
    () => RegisterCubit(getIt<RegisterRepo>()),
  );

  getIt.registerFactory(
    () => LoginCubit(getIt<LoginRepo>()),
  );
}
