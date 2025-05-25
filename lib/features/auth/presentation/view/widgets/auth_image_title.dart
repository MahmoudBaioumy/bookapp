import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/value_manager.dart';

class authImageTitle extends StatelessWidget {
  const authImageTitle({super.key, required this.heigth});

  final double heigth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(AssetsManager.loginlogo, height: heigth * 0.2),
        ),
        SizedBox(height: AppSize.s20),
        Text(
          AppStringsLanguage.AuthTitle.trans(),
          style: textStyle50(color: ColorsManager.bluecolor),
        ),
      ],
    );
  }
}
