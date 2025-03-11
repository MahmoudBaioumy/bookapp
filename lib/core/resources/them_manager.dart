import 'package:bookapp/core/resources/text_styles.dart';
import 'package:bookapp/core/resources/value_manager.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
    ///=== main colors ===///
    primaryColor: ColorsManager.bluecolor,
    disabledColor: ColorsManager.greycolor,

    ///ripple effect when tap on button
    ///=== cardview theme ===///
    cardTheme: CardTheme(
      color: ColorsManager.white1color,
      shadowColor: ColorsManager.greycolor,
      elevation: AppSize.s3,
    ),

    ///=== Appbar theme ===///
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorsManager.bluecolor,
      elevation: AppSize.s3,
      titleTextStyle: textStyle18(color: ColorsManager.greycolor),
    ),

    ///=== button theme ===///
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorsManager.greycolor,
      buttonColor: ColorsManager.bluecolor,
      splashColor: ColorsManager.white1color,
    ),

    /// elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: textStyle18(color: ColorsManager.bluecolor),
        foregroundColor: ColorsManager.bluecolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    ///=== input decoration theme(TextForm Filed) =====================================================///
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: ColorsManager.bluecolor,
      ///content padding
      contentPadding: const EdgeInsets.all(AppPadding.p16),
      //== hint Style ==//
      hintStyle: textStyle18(
        color: ColorsManager.bluecolor,
        fontsize: AppSize.s16,
      ),
      suffixIconColor: ColorsManager.bluecolor,
      //== LabelStyle ==//
      labelStyle: textStyle14(color: ColorsManager.bluecolor),
      errorStyle: textStyle10(color: ColorsManager.redcolor),

      ///== enable ==///
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.greycolor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      ///== focused ==///
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.bluecolor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      ///==== error ===///
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.redcolor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      ///==== focusederror ===///
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.bluecolor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
