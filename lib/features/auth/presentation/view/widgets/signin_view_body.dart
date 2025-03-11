import 'package:bookapp/features/auth/presentation/view/widgets/rowTitle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/app_routes.dart';
import '../../../../../core/resources/string_manager.dart';
import '../../../../../core/resources/value_manager.dart';
import 'auth_image_title.dart';
import 'container_login_textformfield.dart';
import 'container_singin_textformfield.dart';

class signinViewBody extends StatelessWidget {
  const signinViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    return SafeArea(
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
                GoRouter.of(context).push(AppRouter.kLoginView);
              },
              Title: StringsManager.haveAccount,
              buttonTitle: StringsManager.Login,
            ),
            SizedBox(height: AppSize.s8),
            containerSinginTextformField(heigth: heigth * 1.2),
          ],
        ),
      ),
    );
  }
}
