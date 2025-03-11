import 'package:bookapp/core/resources/string_manager.dart';
import 'package:bookapp/core/resources/text_styles.dart';
import 'package:bookapp/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/value_manager.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class containerSinginTextformField extends StatelessWidget {
  containerSinginTextformField({super.key, required this.heigth});

  final double heigth;

  @override
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        height: heigth * 0.43,
        padding: EdgeInsets.all(AppPadding.p16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
          border: Border.all(color: ColorsManager.bluecolor, width: AppSize.s2),
        ),
        child: Column(
          children: [
            // -------------------------- Name -------------------------- //
            CustomTextFormField(
              hintText: StringsManager.name,
              prefixIcon: Icons.person,
              validator: (value) {
                if (value == null) {
                  return StringsManager.namevalidator;
                }
                return null;
              },
            ),
            SizedBox(height: AppSize.s10),
            // -------------------------- Email --------------------------//
            CustomTextFormField(
              hintText: StringsManager.username,
              prefixIcon: Icons.person,
              validator: (value) {
                if (value == null) {
                  return StringsManager.emailValidator;
                }
                return null;
              },
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
            SizedBox(height: AppSize.s10),
            // -------------------------- confirmpassword --------------------------
            CustomTextFormField(
              prefixIcon: Icons.lock,
              hintText: StringsManager.confirmpassword,
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
              },
              text: StringsManager.Login,
            ),
          ],
        ),
      ),
    );
  }
}
