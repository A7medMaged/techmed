import 'package:bloc/bloc.dart';
import 'package:techmed/features/register/data/repos/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerRepo) : super(RegisterInitial());
  final RegisterRepo _registerRepo;

  void register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String nationalId,
    required String gender,
  }) async {
    emit(RegisterLoading());
    final result = await _registerRepo.register(
      name,
      email,
      password,
      phoneNumber,
      nationalId,
      gender,
    );

    result.fold(
      (l) => emit(RegisterFailure(l)),
      (r) => emit(RegisterSuccess('Registration Successful')),
    );
  }
}
