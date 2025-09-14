import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/core/errors/failure.dart';
import 'package:techmed/core/networking/api_endpoints.dart';
import 'package:techmed/features/auth/data/models/register_models/register_request.dart';
import 'package:techmed/features/auth/data/models/register_models/register_response.dart';

class RegisterRepo {
  final Dio dio;
  RegisterRepo(this.dio);

  Future<Either<ServerFailure, RegisterResponse>> register(
    RegisterRequest request,
  ) async {
    try {
      final response = await dio.post(
        ApiEndpoints.register,
        data: request.toJson(),
      );
      return Right(RegisterResponse.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(error: e.toString()));
      }
    }
  }
}
