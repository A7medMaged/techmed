import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:techmed/core/networking/dio_factory.dart';
import 'package:techmed/core/utils/storage_helper.dart';
import 'package:techmed/features/auth/data/repos/login_repo.dart';
import 'package:techmed/features/auth/logic/login_cubit/cubit/login_cubit.dart';
import 'package:techmed/features/auth/data/repos/register_repo.dart';
import 'package:techmed/features/auth/logic/register_cubit/cubit/register_cubit.dart';
import 'package:techmed/features/translation/logic/cubit/local_cubit.dart';
import 'package:techmed/features/vaccination/data/repos/vaccination_repo.dart';
import 'package:techmed/features/vaccination/logic/cubit/vaccination_cubit.dart';

GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  //  Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  // Storage
  getIt.registerLazySingleton<StorageHelper>(() => StorageHelper());

  // Reops
  getIt.registerLazySingleton(
    () => RegisterRepo(getIt<Dio>()),
  );

  getIt.registerLazySingleton(
    () => LoginRepo(getIt<Dio>()),
  );

  getIt.registerLazySingleton(
    () => VaccinationRepo(getIt<Dio>()),
  );

  // Cubits
  getIt.registerFactory(
    () => RegisterCubit(getIt<RegisterRepo>()),
  );

  getIt.registerFactory(
    () => LoginCubit(getIt<LoginRepo>()),
  );

  getIt.registerFactory<LocaleCubit>(
    () => LocaleCubit(),
  );

  getIt.registerFactory(
    () => VaccinationCubit(getIt<VaccinationRepo>()),
  );
}
