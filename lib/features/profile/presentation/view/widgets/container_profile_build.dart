import 'package:bookapp/core/extension/translate.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/lang/string_language_manager.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/value_manager.dart';

class ContainerProfileBuild extends StatelessWidget {
  const ContainerProfileBuild({
    super.key,
    required this.text,
    this.icon,
    this.onpressed,
  });
final String text;
final IconData? icon;
  final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p6),
      height: AppSize.s70,
      decoration: BoxDecoration(
          color: ColorsManager.white1color,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
          border: Border.all(color: ColorsManager.bluecolor,
              width: AppSize.s_7
          )
      ),
      child: Row(
        children: [
          Icon(icon ,size: AppSize.s35,
            color: ColorsManager.bluecolor,
          ),
          SizedBox(width: AppSize.s10,),
          Text(text,
            style: textStyle18(
                color: ColorsManager.blackcolor,
                fontsize: AppSize.s20
            ),
          ),
          Spacer(),
          IconButton(onPressed: onpressed,
              icon: Icon(Icons.arrow_forward_ios,
                color: ColorsManager.blackcolor,
              )
          ),
        ],
      ),
    );
  }
}
