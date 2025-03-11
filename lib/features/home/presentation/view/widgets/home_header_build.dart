import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/string_manager.dart';
import '../../../../../core/resources/text_styles.dart';
import '../../../../../core/resources/value_manager.dart';

class homeHeaderbuild extends StatelessWidget {
  const homeHeaderbuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.menu_outlined,
          color: ColorsManager.greycolor,
          size: AppSize.s24,
        ),
        SizedBox(width: AppSize.s16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Ahmed',
              style: textStyle22(
                color: ColorsManager.blackcolor,
                fontsize: AppSize.s26,
              ),
            ),
            Text(
              StringsManager.homeheader,
              style: textStyle19(color: ColorsManager.greycolor,fontsize: AppSize.s16),
            ),
          ],
        ),
        Spacer(),
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              maxRadius: AppSize.s24,
              foregroundColor: ColorsManager.blackcolor,
            ),
            CircleAvatar(
                maxRadius: AppSize.s22,
                backgroundImage:AssetImage(AssetsManager.User)
            ),
          ],
        )
      ],
    );
  }
}
