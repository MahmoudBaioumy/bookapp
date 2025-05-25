import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';

class AppValidator {
  // -------------------------- auhtEmailValidator -------------------------- //
  static String? email(String? email) {
    if (email == null || email.isEmpty)
      return AppStringsLanguage.emailValidatorEmpty.trans();
    if (!email.contains('@')) return AppStringsLanguage.emailValidator.trans();
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email))
      return AppStringsLanguage.emailValidator.trans();
  }

  // -------------------------- auhtPasswordValidator -------------------------- //
  static String? Password(String? password) {
    if (password == null || password.isEmpty)
      return AppStringsLanguage.passwordValidator.trans();
    if (password.length < 8)
      return AppStringsLanguage.passwordValidator2.trans();
  }
}
