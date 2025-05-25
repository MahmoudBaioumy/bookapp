import 'package:bookapp/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/text_styles.dart';

class RowTitle extends StatelessWidget {
  const RowTitle({
    super.key,
    required this.Title,
    required this.onPressed,
    required this.buttonTitle,
  });

  final String Title;
  final Function() onPressed;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(Title, style: textStyle16(color: ColorsManager.greycolor)),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonTitle,
            style: textStyle22(color: ColorsManager.bluecolor),
          ),
        ),
      ],
    );
  }
}
