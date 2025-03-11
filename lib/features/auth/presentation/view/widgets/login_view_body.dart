import 'package:bookapp/core/resources/app_routes.dart';
import 'package:bookapp/core/resources/assets_manager.dart';
import 'package:bookapp/core/resources/colors.dart';
import 'package:bookapp/core/resources/string_manager.dart';
import 'package:bookapp/core/resources/text_styles.dart';
import 'package:bookapp/core/resources/value_manager.dart';
import 'package:bookapp/features/auth/presentation/view/widgets/rowTitle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'auth_image_title.dart';
import 'container_login_textformfield.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
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
                Title: StringsManager.dontHaveAccount,
                buttonTitle: StringsManager.SignUp,
              ),
              SizedBox(height: AppSize.s8),
              containerLoginTextformField(heigth: heigth * 0.8),
            ],
          ),
        ),
      ),
    );
  }
}

