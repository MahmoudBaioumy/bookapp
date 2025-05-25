import 'package:bookapp/core/extension/translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/lang/string_language_manager.dart';
import '../../../../../core/utils/serves_locator.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_but.dart';
import '../../../../auth/data/repo/auth_repo.dart';
import '../../../../auth/presentation/manager/auth_cubit/auth_cubit.dart';
import '../../../../auth/presentation/manager/auth_cubit/auth_states.dart';
import 'container_profile_build.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, this.token});
  final String? token;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getit.get<AuthRepoImpl>()),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is SuccessLogoutState) {
            // لو اللوج اوت نجح
            GoRouter.of(context).goNamed('loginView');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppStringsLanguage.logoutmassage.trans()),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is FailureLogoutState) {
            // لو حصل فشل
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errmassage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: AppSize.s30,
                  horizontal: AppPadding.p10,
                ),
                child: Column(
                  children: [
                    SizedBox(height: AppSize.s40),
                    Center(
                      child: Image.asset(
                        AssetsManager.logo,
                        color: ColorsManager.bluecolor,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: AppSize.s50),
                    Divider(),
                    SizedBox(height: AppSize.s40),
                    ContainerProfileBuild(
                      text: AppStringsLanguage.Editprofile.trans(),
                      icon: Icons.person,
                      onpressed: () {
                        GoRouter.of(context).push(AppRouter.kEditprofile);
                      },
                    ),
                    SizedBox(height: AppSize.s30),
                    ContainerProfileBuild(
                      text: AppStringsLanguage.contactUs.trans(),
                      icon: Icons.call,
                    ),
                    SizedBox(height: AppSize.s30),
                    ContainerProfileBuild(
                      onpressed: () {
                        GoRouter.of(context).push(AppRouter.klangview);
                      },
                      text: AppStringsLanguage.language.trans(),
                      icon: Icons.language,
                    ),
                    SizedBox(height: AppSize.s30),
                    CustomButton(
                      text: AppStringsLanguage.logOut.trans(),
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .logoutUser(token: token ?? '');
                      },
                      height: AppSize.s60,
                      fontsize: AppSize.s20,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}