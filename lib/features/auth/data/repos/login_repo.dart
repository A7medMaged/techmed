import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/core/errors/failure.dart';
import 'package:techmed/core/networking/api_endpoints.dart';
import 'package:techmed/features/auth/data/models/login_models/login_request.dart';
import 'package:techmed/features/auth/data/models/login_models/login_response.dart';

class LoginRepo {
  final Dio dio;
  LoginRepo(this.dio);

  Future<Either<ServerFailure, LoginResponse>> login(
    LoginRequest request,
  ) async {
    try {
      final response = await dio.post(
       ApiEndpoints.login,
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
