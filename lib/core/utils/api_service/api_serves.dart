import 'package:bookapp/core/utils/api_service/end_point.dart';
import 'package:dio/dio.dart';

class ApiServes {
  final _baseUrl = EndPoint.baseUrl;

  final Dio _dio;

  ApiServes(this._dio);

  // ========================== 🔥 getData function 🔥 ========================== //
  Future<Map<String, dynamic>> getData({required String EndPoint}) async {
    var response = await _dio.get('$_baseUrl$EndPoint');
    return response.data;
  }
}
