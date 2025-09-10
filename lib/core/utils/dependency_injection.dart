import 'package:get_it/get_it.dart';
import 'package:techmed/core/networking/dio_helper.dart';
import 'package:techmed/core/utils/storage_helper.dart';
import 'package:techmed/features/auth/data/repos/login_repo.dart';
import 'package:techmed/features/auth/logic/login_cubit/cubit/login_cubit.dart';
import 'package:techmed/features/auth/data/repos/register_repo.dart';
import 'package:techmed/features/auth/logic/register_cubit/cubit/register_cubit.dart';
import 'package:techmed/features/translation/logic/cubit/local_cubit.dart';

GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  final DioHelper diohelper = DioHelper();
  final StorageHelper storageHelper = StorageHelper();

  //  Dio
  getIt.registerLazySingleton<DioHelper>(() => diohelper);

  // Storage
  getIt.registerLazySingleton<StorageHelper>(() => storageHelper);

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

  getIt.registerFactory<LocaleCubit>(() => LocaleCubit());
}
