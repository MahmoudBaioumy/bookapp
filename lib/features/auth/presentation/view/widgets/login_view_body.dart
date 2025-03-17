import 'package:bookapp/core/utils/assets_manager.dart';
import 'package:bookapp/core/utils/colors.dart';
import 'package:bookapp/core/utils/string_manager.dart';
import 'package:bookapp/core/utils/text_styles.dart';
import 'package:bookapp/core/utils/value_manager.dart';
import 'package:bookapp/features/auth/presentation/view/widgets/rowTitle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_routes.dart';
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
