import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:techmed/core/errors/failure.dart';
import 'package:techmed/core/networking/api_endpoints.dart';
import 'package:techmed/features/medication/data/models/medication_details/medication_details.dart';
import 'package:techmed/features/medication/data/models/medication_model/medication_model.dart';
import 'package:techmed/features/medication/data/models/medication_request.dart';

class MedicationRepo {
  final Dio dio;
  MedicationRepo(this.dio);
  Future<Either<Failures, MedicationModel>> getMedications() async {
    try {
      final response = await dio.get(
        ApiEndpoints.medications,
      );
      final medicationModel = MedicationModel.fromJson(response.data);
      return right(medicationModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  Future<Either<Failures, dynamic>> addMedications(
    MedicationRequest medicationRequest,
  ) async {
    try {
      final response = await dio.post(
        ApiEndpoints.medications,
        data: medicationRequest.toJson(),
      );
      return right(response.data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  Future<Either<Failures, MedicationDetails>> getSingleVaccination(
    int medicationId,
  ) async {
    try {
      final response = await dio.get(
        ApiEndpoints.getSingleMedication(medicationId),
      );
      final medicationDetails = MedicationDetails.fromJson(response.data);
      return Right(medicationDetails);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  Future<Either<Failures, MedicationModel>> deleteMedications(
    int medicationId,
  ) async {
    try {
      final response = await dio.delete(
        ApiEndpoints.deleteMedication(medicationId),
      );
      return right(response.data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
