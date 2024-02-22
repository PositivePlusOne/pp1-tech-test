import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = "https://635e-58-65-198-117.ngrok-free.app/api/v1";

  Future<Response> fetchData(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final Response response = await _dio.get(
        baseUrl + endpoint,
        queryParameters: params,
      );
      return response;
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: endpoint),
        error: error.toString(),
      );
    }
  }
}
