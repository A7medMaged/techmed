import 'package:dartz/dartz.dart';
import 'package:techmed/core/errors/failure.dart';
import 'package:techmed/core/networking/api_endpoints.dart';
import 'package:techmed/core/networking/dio_helper.dart';
import 'package:techmed/features/register/data/models/register_model.dart';

class RegisterRepo {
  final DioHelper _dioHelper;
  RegisterRepo(this._dioHelper);

  Future<Either<String, RegisterModel>> register(
    RegisterModel registerModel,
  ) async {
    try {
      final response = await _dioHelper.postRequest(
        endPoint: ApiEndpoints.register,
        data: registerModel.toJson(),
      );

      if ((response.statusCode == 200 || response.statusCode == 201)) {
        final RegisterModel registerModel = RegisterModel.fromJson(
          response.data,
        );
        return Right(registerModel);
      } else {
        return Left(response.toString());
      }
    } on ServerFailure catch (failure) {
      return Left(failure.message);
    } catch (e) {
      return Left('An unexpected error occurred: ${e.toString()}');
    }
  }
}
