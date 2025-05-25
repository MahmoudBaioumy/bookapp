import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/app_routes.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';
import 'package:bookapp/core/utils/text_styles.dart';
import 'package:bookapp/core/widgets/custom_text_form_field.dart';
import 'package:bookapp/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:bookapp/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class containerSinginTextformField extends StatelessWidget {
  containerSinginTextformField({super.key, required this.heigth});

  final double heigth;

  @override
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController passwordConfirm = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController city = TextEditingController();
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // -------------------------- Name -------------------------- //
              CustomTextFormField(
                hintText: AppStringsLanguage.name.trans(),
                prefixIcon: Icons.person,
                controller: name,
                validator: (value) {
                  if (value == null) {
                    return AppStringsLanguage.namevalidator.trans();
                  }
                  return null;
                },
              ),
              SizedBox(height: AppSize.s10),
              // -------------------------- Email --------------------------//
              CustomTextFormField(
                hintText: AppStringsLanguage.Email.trans(),
                controller: email,
                prefixIcon: Icons.person,
                validator: (value) {
                  if (value == null) {
                    return AppStringsLanguage.emailValidator.trans();
                  }
                  return null;
                },
              ),
              SizedBox(height: AppSize.s14),
              // -------------------------- Password -------------------------- //
              CustomTextFormField(
                prefixIcon: Icons.lock,
                hintText: AppStringsLanguage.password.trans(),
                controller: password,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStringsLanguage.passwordValidator.trans();
                  }
                  if (value.length < 6) {
                    return AppStringsLanguage.passwordValidator2.trans();
                  }
                  return null;
                },
              ),
              SizedBox(height: AppSize.s10),
              // -------------------------- confirmpassword --------------------------
              CustomTextFormField(
                prefixIcon: Icons.lock,
                hintText: AppStringsLanguage.confirmpassword.trans(),
                controller: passwordConfirm,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStringsLanguage.passwordValidator.trans();
                  }
                  if (value.length < 6) {
                    return AppStringsLanguage.passwordValidator2.trans();
                  }
                  if (password.text != passwordConfirm.text) {
                    return AppStringsLanguage.passwordConfirm.trans();
                  }
                  return null;
                },
              ),
              SizedBox(height: AppSize.s10),

              // -------------------------- phone --------------------------
              CustomTextFormField(
                prefixIcon: Icons.phone,
                hintText: AppStringsLanguage.phone.trans(),
                controller: phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStringsLanguage.phonevalidator.trans();
                  }
                  if (value.length < 11) {
                    return AppStringsLanguage.phonevalidator2.trans();
                  }
                  return null;
                },
              ),
              SizedBox(height: AppSize.s10),
              // -------------------------- city --------------------------
              CustomTextFormField(
                prefixIcon: Icons.location_city,
                hintText: AppStringsLanguage.city.trans(),
                controller: city,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStringsLanguage.cityvalidator.trans();
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              SizedBox(height: AppSize.s40),
              BlocConsumer<AuthCubit, AuthStates>(
                listener: (context, state) {
                  if (state is RegisterSuccessStates) {
                    GoRouter.of(context).push(AppRouter.ksignInView);
                    SnackBar(content: Text('register Success'));
                  }
                  if (state is RegisterErrorStates) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errmassage)));
                  }
                },
                builder: (context, state) {
                  return customElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) ;
                      AuthCubit.get(context).registeUser(
                        email: email.text,
                        name: name.text,
                        password: password.text,
                        passwordConfirmation: passwordConfirm.text,
                        city: city.text,
                        phone: phone.text,
                      );
                    },
                    text: AppStringsLanguage.SignUp.trans(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
