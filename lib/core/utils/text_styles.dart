import 'package:bookapp/core/utils/value_manager.dart';
import 'package:flutter/cupertino.dart';

import '../../constants.dart';
import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';

// -------------------------- 18 -------------------------- //
TextStyle textStyle18({double fontsize = AppSize.s18, required Color color}) {
  return _getTextStyle(fontsize, FontWeight.w900, color);
}
// -------------------------- 19 -------------------------- //

TextStyle textStyle19({double fontsize = AppSize.s19, required Color color}) {
  return _getTextStyle(fontsize, FontWeight.bold, color);
}

// -------------------------- 20 -------------------------- //
TextStyle textStyle20({double fontsize = AppSize.s20, required Color color}) {
  return _getTextStyle(fontsize, FontWeight.bold, color);
}

// -------------------------- 22 -------------------------- //
TextStyle textStyle22({double fontsize = AppSize.s22, required Color color}) {
  return _getTextStyle(fontsize, FontWeight.w900, color);
}

// -------------------------- 30 -------------------------- //
TextStyle textStyle30({double fontsize = AppSize.s30, required Color color}) {
  return _getTextStyle(fontsize, FontWeight.w900, color);
}

// -------------------------- 50 --------------------------
TextStyle textStyle50({double fontsize = AppSize.s50, required Color color}) {
  return _getTextStyle(fontsize, FontWeight.w900, color);
}
// -------------------------- 14 -------------------------- //

TextStyle textStyle14({double fontsize = AppSize.s14, required Color color}) {
  return _getTextStyle(fontsize, FontWeight.w900, color);
}

// -------------------------- 12 --------------------------//
TextStyle textStyle12({double fontsize = AppSize.s12, required Color color}) {
  return _getTextStyle(fontsize, FontWeight.normal, color);
}

// -------------------------- 10 --------------------------
TextStyle textStyle10({double fontsize = AppSize.s10, required Color color}) {
  return _getTextStyle(fontsize, FontWeight.normal, color);
}

// -------------------------- 16 -------------------------- //
TextStyle textStyle16({double fontsize = AppSize.s16, required Color color}) {
  return _getTextStyle(fontsize, FontWeight.w600, color,);
}

TextStyle _getTextStyle(double fontsize, FontWeight fontweight, Color color) {
  return TextStyle(
    fontSize: fontsize,
    fontWeight: fontweight,
    color: color,
    fontFamily: GoogleFonts.cairo().fontFamily,
  );
}
