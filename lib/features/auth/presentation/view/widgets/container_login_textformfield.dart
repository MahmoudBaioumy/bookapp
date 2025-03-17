import 'package:bookapp/core/utils/string_manager.dart';
import 'package:bookapp/core/utils/text_styles.dart';
import 'package:bookapp/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class containerLoginTextformField extends StatefulWidget {
  const containerLoginTextformField({super.key, required this.heigth});

  final double heigth;

  @override
  State<containerLoginTextformField> createState() =>
      _containerLoginTextformFieldState();
}

class _containerLoginTextformFieldState
    extends State<containerLoginTextformField> {
  @override
  bool isVisable = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        height: widget.heigth * 0.43,
        padding: EdgeInsets.all(AppPadding.p16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
          border: Border.all(color: ColorsManager.bluecolor, width: AppSize.s2),
        ),
        child: Column(
          children: [
            // -------------------------- userName -------------------------- //
            CustomTextFormField(
              hintText: StringsManager.username,
              prefixIcon: Icons.person,
            ),
            SizedBox(height: AppSize.s16),
            // -------------------------- Password -------------------------- //
            CustomTextFormField(
              prefixIcon: Icons.lock,
              hintText: StringsManager.password,
              //  controller: ,
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return StringsManager.passwordValidator;
                }
                if (value.length < 6) {
                  return StringsManager.passwordValidator2;
                }
                return null;
              },
            ),
            SizedBox(height: 10),

            SizedBox(height: AppSize.s40),
            customElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) ;
                GoRouter.of(context).push(AppRouter.kbottomnavView);
              },
              text: StringsManager.Login,
            ),
          ],
        ),
      ),
    );
  }
}
