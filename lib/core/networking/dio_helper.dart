import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:techmed/core/errors/failure.dart';
import 'package:techmed/core/networking/api_endpoints.dart';

class DioHelper {
  Dio? dio;

  DioHelper() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dio!.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      final Response response = await dio!.get(
        endPoint,
        queryParameters: query,
      );

      return response;
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    }
  }

  Future<Response> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      final Response response = await dio!.post(
        endPoint,
        data: data,
      );

      return response;
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    }
  }
}
