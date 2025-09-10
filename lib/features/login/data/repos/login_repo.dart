import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/core/errors/failure.dart';
import 'package:techmed/core/networking/api_endpoints.dart';
import 'package:techmed/core/networking/dio_helper.dart';
import 'package:techmed/features/login/data/models/login_model.dart';

class LoginRepo {
  final DioHelper _dioHelper;
  LoginRepo(this._dioHelper);

  Future<Either<String, LoginModel>> login(
    LoginModel loginModel,
  ) async {
    try {
      final response = await _dioHelper.postRequest(
        endPoint: ApiEndpoints.login,
        data: loginModel.toJson(),
      );

      return Right(LoginModel.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e) as String);
      } else {
        return left(ServerFailure(error: e.toString()) as String);
      }
    }
  }
}
