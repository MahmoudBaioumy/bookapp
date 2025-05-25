import 'package:bookapp/features/profile/data/repo/profile_repo.dart';
import 'package:bookapp/features/profile/presentation/manager/cubit/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.profileRepo) : super(ProfileInitialStates());
  final ProfileRepo profileRepo;

  static ProfileCubit get(context) => BlocProvider.of(context);

  // -------------------------- get profile -------------------------- //

  Future<void> getProfile({required String token}) async {
    var result = await profileRepo.getProfile(token);
    result.fold(
      (failure) {
        emit(profileFailureStates(failure.errMessage));
      },
      (showProfileModel) {
        emit(profileSuccessStates(showProfileModel));
      },
    );
  }

  // -------------------------- update Profile -------------------------- //

  Future<void> updateProfile({
    required String name,
    required String phone,
    required String city,
  }) async {
    try {
      emit(updateprofileleLoadingStates());
      var result = await profileRepo.updateProfile(
        name: name,
        phone: phone,
        city: city,
      );

      result.fold(
            (failure) {
          print('Update Failed: ${failure.errMessage}');
          emit(updateprofileleFailureStates(failure.errMessage));
        },
            (updateProfileModel) {
          print('Update Success: ${updateProfileModel.message}');
          emit(updateprofileleSuccessStates(updateProfileModel));
        },
      );
    } catch (e) {
      print('Unexpected Error during updateProfile: $e');
      emit(updateprofileleFailureStates(e.toString()));
    }
  }

}
