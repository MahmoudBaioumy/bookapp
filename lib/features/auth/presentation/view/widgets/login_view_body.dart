import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/serves_locator.dart';
import 'package:bookapp/core/utils/value_manager.dart';
import 'package:bookapp/features/auth/data/repo/auth_repo.dart';
import 'package:bookapp/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:bookapp/features/auth/presentation/view/widgets/rowTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/lang/string_language_manager.dart';
import 'auth_image_title.dart';
import 'container_login_textformfield.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => AuthCubit(getit.get<AuthRepoImpl>()),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p30,
              vertical: AppPadding.p20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                authImageTitle(heigth: heigth),
                SizedBox(height: AppSize.s20),
                RowTitle(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.ksignInView);
                  },
                  Title: AppStringsLanguage.dontHaveAccount.trans(),
                  buttonTitle: AppStringsLanguage.SignUp.trans(),
                ),
                SizedBox(height: AppSize.s8),
                containerLoginTextformField(heigth: heigth * 0.85),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
