import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/core/errors/failure.dart';
import 'package:techmed/core/networking/api_endpoints.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_details/vaccination_details.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_model/vaccination_model.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_request.dart';

class VaccinationRepo {
  final Dio dio;
  VaccinationRepo(this.dio);

  Future<Either<Failures, VaccinationModel>> getVaccination() async {
    try {
      final response = await dio.get(
        ApiEndpoints.vaccinations,
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
      final response = await dio.post(
        ApiEndpoints.vaccinations,
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
      final response = await dio.get(
        ApiEndpoints.getSingleVaccination(vaccinationId),
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
      final response = await dio.delete(
        ApiEndpoints.deleteVaccination(vaccinationId),
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
