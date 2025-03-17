import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/string_manager.dart';
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
          StringsManager.AuthTitle,
          style: textStyle50(color: ColorsManager.bluecolor),
        ),
      ],
    );
  }
}
