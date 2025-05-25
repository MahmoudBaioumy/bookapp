import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/assets_manager.dart';
import 'package:bookapp/core/utils/colors.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';

import 'package:bookapp/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/value_manager.dart';

class ProfileHeaderBuild extends StatelessWidget {
  const ProfileHeaderBuild({super.key, required this.image});

  @override
  final String image;
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s16),
        CircleAvatar(
          maxRadius: AppSize.s80,
          backgroundImage: NetworkImage(image),
        ),
      ],
    );
  }
}
