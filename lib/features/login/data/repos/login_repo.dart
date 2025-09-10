import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/core/errors/failure.dart';
import 'package:techmed/core/networking/api_endpoints.dart';
import 'package:techmed/core/networking/dio_helper.dart';
import 'package:techmed/features/login/data/models/login_request.dart';
import 'package:techmed/features/login/data/models/login_response.dart';

class LoginRepo {
  final DioHelper _dioHelper;
  LoginRepo(this._dioHelper);

  Future<Either<ServerFailure, LoginResponse>> login(
    LoginRequest request,
  ) async {
    try {
      final response = await _dioHelper.postRequest(
        endPoint: ApiEndpoints.login,
        data: request.toJson(),
      );

      return right(LoginResponse.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(error: e.toString()));
      }
    }
  }
}
