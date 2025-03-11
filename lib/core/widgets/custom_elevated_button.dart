import 'package:bookapp/core/resources/value_manager.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/string_manager.dart';
import '../resources/text_styles.dart';

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
