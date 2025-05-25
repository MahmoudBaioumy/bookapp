import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/validator_manager.dart';
import 'package:bookapp/core/widgets/custom_text_form_field.dart';
import 'package:bookapp/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:bookapp/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/lang/string_language_manager.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class containerLoginTextformField extends StatefulWidget {
  const containerLoginTextformField({super.key, required this.heigth});

  final double heigth;

  @override
  State<containerLoginTextformField> createState() =>
      _containerLoginTextformFieldState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

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
          border: Border.all(
            color: ColorsManager.bluecolor,
            width: AppSize.s2,
          ),
        ),
        child: Column(
          children: [
            // -------------------------- userName -------------------------- //
            CustomTextFormField(
              hintText: AppStringsLanguage.Email.trans(),
              prefixIcon: Icons.person,
              controller: email,
              validator: AppValidator.email,
            ),
            SizedBox(height: AppSize.s16),
            // -------------------------- Password -------------------------- //
            CustomTextFormField(
              prefixIcon: Icons.lock,
              hintText: AppStringsLanguage.password.trans(),
              controller: password,
              isPassword: true,
              validator: AppValidator.Password,
            ),
            SizedBox(height: 10),

            SizedBox(height: AppSize.s40),
            BlocConsumer<AuthCubit, AuthStates>(
              listener: (context, state) {
                if (state is SuccessLoginState) {
                  GoRouter.of(context).push(AppRouter.kbottomnavView);
                }
                if (state is FailureLoginSate) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errmassage)),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoadingLoginState) {
                  return Center(child: CircularProgressIndicator());
                }
                return customElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      AuthCubit.get(context).loginUser(
                        email: email.text,
                        password: password.text,
                      );
                    }
                  },
                  text: AppStringsLanguage.Login.trans(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
