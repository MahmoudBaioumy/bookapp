import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/value_manager.dart';

class ListViewTitleRow extends StatelessWidget {
  const ListViewTitleRow({
    super.key,
    required this.Title,
     this.onPressed,
  });

  @override
  final String Title;
  final Function()? onPressed;
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
