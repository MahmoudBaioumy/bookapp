import 'package:bookapp/core/utils/errors/failures.dart';
import 'package:bookapp/features/auth/data/model/login_model.dart';
import 'package:bookapp/features/auth/data/model/rigister_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/utils/api_service/api_serves.dart';
import '../../../../core/utils/api_service/end_point.dart';
import '../../../../core/utils/storage/cache_helper.dart';
import '../model/logout_model.dart';

// ========================== 🔥 AuthRepo 🔥 ========================== //
abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> LoginUser({
    required String email,
    required String Password,
  });

  Future<Either<Failure, RigisterModel>> rigisterUser({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
    required String city,
  });

  Future<Either<Failure, LogoutUserModel>> LooutUser({required String token});
}
// ========================== 🔥 AuthRepoImpl 🔥 ========================== //

class AuthRepoImpl extends AuthRepo {
  final ApiServes apiServes;

  AuthRepoImpl(this.apiServes);

  @override
  // ========================== 🔥 Login Function 🔥 ========================== //
  Future<Either<Failure, LoginModel>> LoginUser({
    required String email,
    required String Password,
  }) async {
    try {
      print('🔐 Trying to login with:');
      print('Email: $email');
      print('Password: $Password');

      var res = await apiServes.postData(
        EndPoint: EndPoint.login,
        data: {'email': email, 'password': Password},
      );

      print('✅ Response from API: $res');

      if (res['data'] == null) {
        print('⚠️ No data field in response');
        return left(ServerFailure('Invalid response: data is missing'));
      }
      // -------------------------- save token -------------------------- //
      String? token = res['data']?['token'];
        await CacheHelper().setToken(token??'');
        print('✅ Token from API: $token');


      // -------------------------- save name -------------------------- //
      String? name = res['data']?['user']?['name'];
      if (name != null) {
        await CacheHelper().setName(name);
        print('✅ Name from API: $name');
      } else {
        print('⚠️ Name is null or missing from response');
      }

      return right(LoginModel.fromJson(res));
    } catch (e, s) {
      print('❌ Error StackTrace: $s');
      print('❌ Exception Caught: $e');

      if (e is DioException) {
        print('❗ Dio error response: ${e.response?.data}');
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  // ========================== 🔥 Register Function 🔥 ========================== //

  @override
  Future<Either<Failure, RigisterModel>> rigisterUser({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
    required String city,
  }) async {
    try {
      var data = await apiServes.postData(
        EndPoint: EndPoint.register,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'phone': phone,
          'city': city,
        },
      );
      print('✅ Response from API register: $data');
      return right(RigisterModel.fromJson(data));
    } catch (e, s) {
      // Log the error details
      print('❌ Error in registration: $e');
      print('❌ Stack trace: $s');

      if (e is DioException) {
        print('❗ Dio error response: ${e.response?.data}');
        print('❗ Dio error status code: ${e.response?.statusCode}');
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  // ========================== 🔥 logout Function 🔥 ========================== //

  @override
  Future<Either<Failure, LogoutUserModel>> LooutUser({
    required String token,
  }) async {
    try {
      var data = await apiServes.postData(
        EndPoint: EndPoint.logout,
        Headers: {'Authorization': 'Bearer $token'},
      );
      print(data);
      print('✅ Response from API logout: $data');
      return right(LogoutUserModel.fromJson(data));
    } catch (e, s) {
      print('❌ Error in logout: $e');
      print('❌ Stack trace logout: $s');
      if (e is DioException) {
        print('❗ Dio error response: ${e.response?.data}');
        print('❗ Dio error status code: ${e.response?.statusCode}');
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
