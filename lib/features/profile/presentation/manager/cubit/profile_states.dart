import 'package:bookapp/features/profile/data/model/update_profile_model.dart';

import '../../../data/model/show_profile_model.dart';

abstract class ProfileStates {}
// -------------------------- get profile -------------------------- //
class ProfileInitialStates extends ProfileStates {}

class profileLoadingStates extends ProfileStates {}

class profileSuccessStates extends ProfileStates {
  final ShowProfileModel showProfileModel;

  profileSuccessStates(this.showProfileModel);
}

class profileFailureStates extends ProfileStates {
  final String errMassage;

  profileFailureStates(this.errMassage);
}
// -------------------------- update Profile -------------------------- //

class updateprofileInitialStates extends ProfileStates{}

class updateprofileleLoadingStates extends ProfileStates{}

class updateprofileleSuccessStates extends ProfileStates {
  final UpdateProfileModel updateProfileModel;

  updateprofileleSuccessStates(this.updateProfileModel);
}

class updateprofileleFailureStates extends ProfileStates {
  final String errMassage;

  updateprofileleFailureStates(this.errMassage);
}