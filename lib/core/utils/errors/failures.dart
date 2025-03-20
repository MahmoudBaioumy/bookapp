import 'package:bookapp/core/utils/string_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
        return ServerFailure(StringsManager.connectionTimeout);
      // -------------------------- sendTimeout --------------------------//
      case DioExceptionType.sendTimeout:
        return ServerFailure(StringsManager.sendTimeout);
      // -------------------------- receiveTimeout --------------------------//
      case DioExceptionType.receiveTimeout:
        return ServerFailure(StringsManager.receiveTimeout);
      // -------------------------- badCertificate --------------------------//
      case DioExceptionType.badCertificate:
        return ServerFailure(StringsManager.nornalmassege);
      // -------------------------- badResponse --------------------------//
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      // -------------------------- cancel --------------------------//
      case DioExceptionType.cancel:
        return ServerFailure(StringsManager.cancel);
      // -------------------------- connectionError -------------------------- //
      case DioExceptionType.connectionError:
        return ServerFailure(StringsManager.connectionError);
      // -------------------------- unknown -------------------------- //
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure(StringsManager.unknown);
        }
        return ServerFailure(StringsManager.nornalmassege2);
      default:
        return ServerFailure(StringsManager.nornalmassege);
    }
  }

  // ========================== 🔥 handling server error 🔥 ========================== //
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return (response['message']);
    } else if (statusCode == 404) {
      return ServerFailure(StringsManager.state404);
    } else if (statusCode == 500) {
      return ServerFailure(StringsManager.state500);
    } else {
      return ServerFailure(StringsManager.nornalmassege);
    }
  }
}
