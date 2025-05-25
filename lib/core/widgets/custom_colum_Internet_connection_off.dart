import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_styles.dart';
import '../utils/value_manager.dart';

class customColumInternetConnectionOff extends StatelessWidget {
  const customColumInternetConnectionOff({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            color: ColorsManager.redcolor,
            size: AppSize.s50,
          ),
          Text(
            AppStringsLanguage.offline.trans(),
            style: textStyle22(color: ColorsManager.redcolor),
          ),
        ],
      ),
    );
  }
}
