import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    required String message,
    Color backgroundColor = Colors.green,
    IconData icon = Icons.check_circle,
    Key? key,
  }) : super(
    key: key,
    content: Row(
      children: [
        Expanded(child: Text(message)),
      ],
    ),
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}