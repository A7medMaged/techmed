import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/core/errors/failure.dart';
import 'package:techmed/core/networking/api_endpoints.dart';
import 'package:techmed/core/networking/dio_helper.dart';
import 'package:techmed/features/register/data/models/register_request.dart';
import 'package:techmed/features/register/data/models/register_response.dart';

class RegisterRepo {
  final DioHelper _dioHelper;
  RegisterRepo(this._dioHelper);

  Future<Either<ServerFailure, RegisterResponse>> register(
    RegisterRequest request,
  ) async {
    try {
      final response = await _dioHelper.postRequest(
        endPoint: ApiEndpoints.register,
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
