abstract class AuthStates {}
// ========================== 🔥 LoginState 🔥 ========================== //

class InitLoginState extends AuthStates {}

class LoadingLoginState extends AuthStates {}

class SuccessLoginState extends AuthStates {}

class FailureLoginSate extends AuthStates {
  final String errmassage;

  FailureLoginSate(this.errmassage);
}
// ========================== 🔥RegisterState 🔥 ==========================

class InitRegisterState extends AuthStates {}

class RegisterLoadingStates extends AuthStates {}

class RegisterSuccessStates extends AuthStates {}

class RegisterErrorStates extends AuthStates {
  final String errmassage;

  RegisterErrorStates({required this.errmassage});
}
// ========================== 🔥 logoutState 🔥 ========================== //

class InitLogoutState extends AuthStates {}

class LoadingLogoutState extends AuthStates {}

class SuccessLogoutState extends AuthStates {}

class FailureLogoutState extends AuthStates {
  final String errmassage;

  FailureLogoutState({required this.errmassage});
}

