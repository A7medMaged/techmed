import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:techmed/core/networking/api_endpoints.dart';
import 'package:techmed/core/utils/dependency_injection.dart';
import 'package:techmed/core/utils/storage_helper.dart';

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
    final String? token = await getIt<StorageHelper>().getUserToken();
    final Response response = await dio!.get(
      endPoint,
      queryParameters: query,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response;
  }

  Future<Response> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    final String? token = await getIt<StorageHelper>().getUserToken();
    final Response response = await dio!.post(
      endPoint,
      data: data,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response;
  }

  Future<Response> deleteRequest({
    required String endPoint,
  }) async {
    final String? token = await getIt<StorageHelper>().getUserToken();
    final Response response = await dio!.delete(
      endPoint,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response;
  }
}
