import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/core/errors/failure.dart';
import 'package:techmed/core/networking/api_endpoints.dart';
import 'package:techmed/core/networking/dio_helper.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_details/vaccination_details.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_model/vaccination_model.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_request.dart';

class VaccinationRepo {
  final DioHelper _dioHelper;
  VaccinationRepo(this._dioHelper);

  Future<Either<ServerFailure, VaccinationModel>> getVaccination() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.vaccinations,
      );
      final vaccinationModel = VaccinationModel.fromJson(response.data);
      return Right(vaccinationModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  Future<Either<Failures, dynamic>> addVaccination(
    VaccinationRequest vaccinationRequest,
  ) async {
    try {
      final response = await _dioHelper.postRequest(
        endPoint: ApiEndpoints.vaccinations,
        data: vaccinationRequest.toJson(),
      );
      return Right(response.data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  Future<Either<Failures, VaccinationDetails>> getSingleVaccination(
    int vaccinationId,
  ) async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.getSingleVaccination(vaccinationId),
      );
      final vaccinationDetails = VaccinationDetails.fromJson(response.data);
      return Right(vaccinationDetails);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  Future<Either<Failures, dynamic>> deleteVaccination(
    int vaccinationId,
  ) async {
    try {
      final response = await _dioHelper.deleteRequest(
        endPoint: ApiEndpoints.deleteVaccination(vaccinationId),
      );
      return Right(response.data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
