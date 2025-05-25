
import 'package:bookapp/features/auth/data/repo/auth_repo.dart';
import 'package:bookapp/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/storage/cache_helper.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.authRepo) : super(InitLoginState());
  final AuthRepo authRepo;

  static AuthCubit get(context) => BlocProvider.of(context);

  // -------------------------- Login -------------------------- //
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginState());
    var result = await authRepo.LoginUser(email: email, Password: password);
    print('ana ana $result');
    result.fold(
      (Failure) {
        emit(FailureLoginSate(Failure.errMessage));
      },
      (loginModel) {
        emit(SuccessLoginState());
      },
    );
  }

  // -------------------------- Register -------------------------- //
  Future<void> registeUser({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
    required String city,
  }) async {
    emit(RegisterLoadingStates());
    var date = await authRepo.rigisterUser(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      phone: phone,
      city: city,
    );
    print('register $date');

    date.fold(
      (Failure) {
        emit(RegisterErrorStates(errmassage: Failure.errMessage));
      },
      (RigisterModel) {
        emit(RegisterSuccessStates());
      },
    );
  }
  // -------------------------- logout -------------------------- //

  Future<void> logoutUser({required String token}) async {
    emit(LoadingLogoutState());
    var date = await authRepo.LooutUser(token: token);
    date.fold((failure) {
      emit(FailureLogoutState(errmassage: failure.errMessage,));
    }, (LogoutUserModel) async{
      await CacheHelper.removeData(key: StorageKeys.token);
      await CacheHelper.removeData(key: StorageKeys.Name);
      emit(SuccessLogoutState());
      emit(SuccessLogoutState());
    });
  }
}
