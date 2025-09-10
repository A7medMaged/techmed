import 'package:bloc/bloc.dart';
import 'package:techmed/features/register/data/models/register_model.dart';
import 'package:techmed/features/register/data/repos/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerRepo) : super(RegisterInitial());
  final RegisterRepo _registerRepo;

  void register(RegisterModel registerModel) async {
    emit(RegisterLoading());
    final result = await _registerRepo.register(registerModel);

    result.fold(
      (l) => emit(RegisterFailure(l)),
      (r) => emit(RegisterSuccess('Registration Successful')),
    );
  }
}
