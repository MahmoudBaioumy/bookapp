import 'package:bookapp/core/utils/colors.dart';
import 'package:bookapp/core/utils/text_styles.dart';
import 'package:bookapp/core/utils/value_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.textcolor,
    this.bgColor,
    this.fgColor,
    this.height,
    this.width,
    this.fontWeight,
    this.radius,
    required this.onPressed,
    this.textStyle,
    this.isBorder = false,
    this.fontsize,
  });

  final String text;
  final Color? textcolor;
  final FontWeight? fontWeight;
  final bool? isBorder;
  final Color? bgColor;
  final Color? fgColor;
  final double? height;
  final double? width;
  final double? radius;
  final TextStyle? textStyle;
  final Function() onPressed;
final double? fontsize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side:
              isBorder == true
                  ? const BorderSide()
                  : const BorderSide(width: 0, color: Colors.transparent),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius??8)),
          backgroundColor: bgColor ?? ColorsManager.bluecolor,
          foregroundColor: fgColor ?? ColorsManager.white1color,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style:
              textStyle ??
              TextStyle(
                color: textcolor ?? ColorsManager.white1color,
                fontWeight: fontWeight ?? FontWeight.normal,
                fontSize: fontsize ?? AppSize.s18
              ),
        ),
      ),
    );
  }
}
