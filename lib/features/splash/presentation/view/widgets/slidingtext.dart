import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/colors.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';
import 'package:bookapp/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({Key? key, required this.slidingAnimation})
    : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text(
            AppStringsLanguage.titleSplash.trans(),
            textAlign: TextAlign.center,
            style: textStyle18(color: ColorsManager.white1color),
          ),
        );
      },
    );
  }
}
