import 'package:bloc/bloc.dart';
import 'package:techmed/features/login/data/models/login_model.dart';
import 'package:techmed/features/login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());
  final LoginRepo _loginRepo;

  void login(LoginModel loginModel) async {
    emit(LoginLoading());
    final result = await _loginRepo.login(
      loginModel,
    );

    result.fold(
      (l) => emit(LoginFailure(l)),
      (r) => emit(LoginSuccess('Login Successful')),
    );
  }
}
