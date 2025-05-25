import 'dart:convert';

import 'package:bookapp/core/utils/api_service/api_serves.dart';
import 'package:bookapp/core/utils/errors/failures.dart';
import 'package:bookapp/features/profile/data/model/show_profile_model.dart';
import 'package:bookapp/features/profile/data/model/update_profile_model.dart';
import 'package:bookapp/features/profile/data/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_service/end_point.dart';
import '../../../../core/utils/storage/cache_helper.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ApiServes apiServes;

  ProfileRepoImpl(this.apiServes);
// -------------------------- getProfile -------------------------- //
  @override
  Future<Either<Failure, ShowProfileModel>> getProfile(String token) async {
    try {
      var response = await apiServes.getData(EndPoint: EndPoint.profile);
      return right(ShowProfileModel.fromJson(response));
    } catch (e, s) {
      print(e);
      print(s);
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }

  }
// -------------------------- update Profile -------------------------- //
  @override
  Future<Either<Failure, UpdateProfileModel>> updateProfile({
    required String name,
    required String phone,
    required String city,
  }) async {
    try {
      // الحصول على الـ token
      String? token = await CacheHelper().getToken;

      // إرسال البيانات عبر الـ API
      var response = await apiServes.postData(
        EndPoint: EndPoint.updateProfile,
        data: {
          'name': name,
          'phone': phone,
          'city': city,
        },
        Headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      // طباعة الاستجابة لتحديد شكل البيانات
      print('Response: $response');

      // التأكد من أن البيانات ليست فارغة
      if (response['data'] == null) {
        return left(ServerFailure('Invalid response: data is missing'));
      }

      // تحويل البيانات إلى الـ model
      return right(UpdateProfileModel.fromJson(response));

    } catch (e, s) {
      print("ssadasdasdasdas $s");
      // التعامل مع الأخطاء باستخدام DioException
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      // التعامل مع الأخطاء الأخرى
      return left(ServerFailure('An error occurred: ${e.toString()}'));
    }
  }

}
