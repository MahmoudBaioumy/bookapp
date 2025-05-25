import 'package:bookapp/core/extension/translate.dart';
import 'package:dio/dio.dart';

import '../lang/string_language_manager.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  // ========================== 🔥in this factory check the Error who come from Dio Error 🔥 ========================== //
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      // -------------------------- connectionTimeout --------------------------//
      case DioExceptionType.connectionTimeout:
        return ServerFailure(AppStringsLanguage.connectionTimeout.trans());
      // -------------------------- sendTimeout --------------------------//
      case DioExceptionType.sendTimeout:
        return ServerFailure(AppStringsLanguage.sendTimeout.trans());
      // -------------------------- receiveTimeout --------------------------//
      case DioExceptionType.receiveTimeout:
        return ServerFailure(AppStringsLanguage.receiveTimeout.trans());
      // -------------------------- badCertificate --------------------------//
      case DioExceptionType.badCertificate:
        return ServerFailure(AppStringsLanguage.nornalmassege.trans());
      // -------------------------- badResponse --------------------------//
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      // -------------------------- cancel --------------------------//
      case DioExceptionType.cancel:
        return ServerFailure(AppStringsLanguage.cancel.trans());
      // -------------------------- connectionError -------------------------- //
      case DioExceptionType.connectionError:
        return ServerFailure(AppStringsLanguage.connectionError.trans());
      // -------------------------- unknown -------------------------- //
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure(AppStringsLanguage.unknown.trans());
        }
        return ServerFailure(AppStringsLanguage.nornalmassege2.trans());
      default:
        return ServerFailure(AppStringsLanguage.nornalmassege.trans());
    }
  }

  // ========================== 🔥 handling server error 🔥 ========================== //
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return (response['message']);
    } else if (statusCode == 404) {
      return ServerFailure(AppStringsLanguage.state404.trans());
    } else if (statusCode == 500) {
      return ServerFailure(AppStringsLanguage.state500.trans());
    } else {
      return ServerFailure(AppStringsLanguage.nornalmassege.trans());
    }
  }
}
