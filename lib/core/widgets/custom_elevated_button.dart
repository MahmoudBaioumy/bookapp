import 'package:bookapp/core/utils/value_manager.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/string_manager.dart';
import '../utils/text_styles.dart';

class customElevatedButton extends StatelessWidget {
  const customElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonHeigth,
  });

  @override
  final String text;
  final Function() onPressed;
  final double? buttonHeigth;

  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeigth ?? AppSize.s50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorsManager.bluecolor),
        ),
        onPressed: onPressed,
        child: Text(text, style: textStyle22(color: ColorsManager.white1color)),
      ),
    );
  }
}
