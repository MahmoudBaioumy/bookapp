import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';
import 'package:bookapp/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:bookapp/features/auth/presentation/view/widgets/rowTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/serves_locator.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../data/repo/auth_repo.dart';
import 'auth_image_title.dart';
import 'container_singin_textformfield.dart';

class signinViewBody extends StatelessWidget {
  const signinViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider(
      create: (context) => AuthCubit(getit.get<AuthRepoImpl>()),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p30,
            vertical: AppPadding.p20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                authImageTitle(heigth: heigth),
                SizedBox(height: AppSize.s20),
                RowTitle(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kLoginView);
                  },
                  Title: AppStringsLanguage.haveAccount.trans(),
                  buttonTitle: AppStringsLanguage.Login.trans(),
                ),
                SizedBox(height: AppSize.s8),
                containerSinginTextformField(heigth: heigth * 1.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
