import 'package:bookapp/core/utils/assets_manager.dart';
import 'package:bookapp/core/utils/colors.dart';
import 'package:bookapp/core/utils/string_manager.dart';
import 'package:bookapp/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/value_manager.dart';

class ProfileHeaderBuild extends StatelessWidget {
  const ProfileHeaderBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringsManager.ProfileTitel,
              style: textStyle22(
                color: ColorsManager.white1color,
                fontsize: AppSize.s40,
              ),
            ),
            SizedBox(width: AppSize.s50),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.login_outlined,
                color: ColorsManager.white1color,
                size: 40,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSize.s16),
        CircleAvatar(
          maxRadius: AppSize.s80,
          backgroundImage: AssetImage(AssetsManager.User),
        ),
      ],
    );
  }
}
