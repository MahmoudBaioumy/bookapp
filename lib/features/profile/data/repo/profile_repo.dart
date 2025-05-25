import 'package:bookapp/core/utils/errors/failures.dart';
import 'package:bookapp/features/profile/data/model/show_profile_model.dart';
import 'package:bookapp/features/profile/data/model/update_profile_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure,ShowProfileModel>> getProfile(String token);
  Future<Either<Failure,UpdateProfileModel>> updateProfile({
    required String name,
    required String phone,
    required String city,
  }

      );
}