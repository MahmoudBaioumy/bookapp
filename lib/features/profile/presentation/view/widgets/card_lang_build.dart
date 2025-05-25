import 'package:flutter/material.dart';

import '../../../../../core/utils/value_manager.dart';

InkWell buildLanguageWidget({required double width, required double height,
  required void Function()? onTap, required String title, required Color colorContainer, required Color colorText}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      elevation: 2.5,
      shadowColor: colorContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: colorContainer,
      child: SizedBox(
        //   width: fullWidth(context: context).width,
        height: AppSize.s70,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s10),
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(fontSize: AppSize.s18, color: colorText),
            ),
          ),
        ),
      ),
    ),
  );
}
