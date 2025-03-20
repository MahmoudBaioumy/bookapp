import 'package:bookapp/core/utils/value_manager.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMassage});

  final String errMassage;

  @override
  Widget build(BuildContext context) {
    return Text(
      errMassage,
      style: TextStyle(color: Colors.red, fontSize: AppSize.s18),
    );
  }
}
