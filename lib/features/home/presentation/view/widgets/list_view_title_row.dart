import 'package:flutter/material.dart';

import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/string_manager.dart';
import '../../../../../core/resources/text_styles.dart';
import '../../../../../core/resources/value_manager.dart';

class ListViewTitleRow extends StatelessWidget {
  const ListViewTitleRow({super.key, required this.Title, required this.onPressed});

  @override
  final String Title ;
  final Function ()   onPressed;
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          Title,
          style: textStyle22(
            color: ColorsManager.blackcolor,
            fontsize: AppSize.s24,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.arrow_forward, color: ColorsManager.blackcolor),
        ),
      ],
    );
  }
}
