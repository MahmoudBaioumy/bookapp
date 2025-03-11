import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/string_manager.dart';
import '../../../../../core/resources/text_styles.dart';
import '../../../../../core/resources/value_manager.dart';

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
          StringsManager.AuthTitle,
          style: textStyle50(color: ColorsManager.bluecolor),
        ),
      ],
    );
  }
}
