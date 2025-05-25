import 'package:dio/dio.dart';

import '../storage/cache_helper.dart';
import 'end_point.dart';
import 'package:dio/dio.dart';

class DioLoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('Request: ${options.method} ${options.uri}');
    print('Headers: ${options.headers}');
    print('Request Data: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response: ${response.statusCode} ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('Error: ${err.response?.statusCode} ${err.message}');
    super.onError(err, handler);
  }
}
class ApiServes {
  late final Dio _dio;

  ApiServes(){
    _dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        headers: {
          'Accept': 'application/json',
          // لو عندك توكن أو لغة ضيفهم هنا
           'Authorization': 'Bearer YOUR_TOKEN',
        },
      ),
    );
    _dio.interceptors.add(DioLoggerInterceptor()); // Adding the logger interceptor

  }


  // ========================== 🔥 getData function 🔥 ========================== //
  Future<Map<String, dynamic>> getData({required String EndPoint}) async {
    String token = await CacheHelper.getData(key: "TOKEN");

    var response = await _dio.get(EndPoint,
    options: Options(
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }
    )
    );

    return response.data;
  }

  // -------------------------- getBooksBy id -------------------------- //
  Future<Map<String, dynamic>> getBooksById({required int id}) async {
    try {
      final response = await _dio.get('products/$id');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load book details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching book details: $e');
      throw Exception('Failed to load book details');
    }
  }

  // ========================== 🔥 postData function 🔥 ========================== //
  Future<Map<String, dynamic>> postData({
    required String EndPoint,
    Map<String, dynamic>? Headers,
    Map<String, dynamic>? query,
    var data,
  }) async {
    try {
      // جلب التوكن من الكاش
      String? token = await CacheHelper.getData(key: "TOKEN");


      // إرسال البيانات عبر Dio
      var response = await _dio.post(
        EndPoint,
        data: data,
        options: Options(
          headers: {
            'Accept': 'application/json',
           if(token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );

      // التأكد من أن response.data غير فارغ
      if (response.data == null) {
        throw Exception("No data returned from API");
      }

      // إرجاع البيانات التي وصلت من الـ API
      return response.data;
    } catch (e, s) {
      // طباعة الأخطاء في حالة حدوث أي استثناء
      print('❌ Error StackTrace: $s');
      print('❌ Exception Caught: $e');

      // إرجاع رسالة خطأ تفصيلية
      return {'error': e.toString()};
    }
  }
  // ========================== 🔥 getCategory Function 🔥 ========================== //
  Future<Map<String, dynamic>> getCategoryById({required int id}) async {
    try {
      final url = EndPoint.categoryDetails(id); // تكوين الـ URL النهائي
      print('Request URL: $url'); // طباعة الـ URL لمساعدتك في تتبع المشكلة

      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return response.data;  // إذا كان الـ status 200، رد البيانات
      } else {
        print('❌ Response status: ${response.statusCode}');
        throw Exception('Your request not Found, please try later!');
      }
    } catch (e) {
      print('❌ Dio error: $e');
      if (e is DioException) {
        // إذا كان الخطأ من نوع DioError، يمكن استخراج معلومات إضافية عن الخطأ
        print('❌ Dio error details: ${e.response?.data}');
      }
      throw Exception('Your request not Found, please try later!');
    }
  }
}