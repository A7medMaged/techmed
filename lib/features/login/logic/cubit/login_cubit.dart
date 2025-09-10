import 'package:bloc/bloc.dart';
import 'package:techmed/features/login/data/models/login_request.dart';
import 'package:techmed/features/login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());
  final LoginRepo _loginRepo;

  void login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await _loginRepo.login(
      request,
    );

    result.fold(
      (l) => emit(LoginFailure(l)),
      (r) => emit(LoginSuccess('Login Successful')),
    );
  }
}
