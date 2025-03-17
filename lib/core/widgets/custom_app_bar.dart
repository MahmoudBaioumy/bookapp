import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/string_manager.dart';
import '../utils/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.onPressed});
  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: textStyle20(color: ColorsManager.white1color)),
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back_ios, color: ColorsManager.white1color),
      ),
    );
  }
}
