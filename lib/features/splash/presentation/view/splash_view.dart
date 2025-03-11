import 'package:bookapp/core/resources/colors.dart';
import 'package:bookapp/features/splash/presentation/view/widgets/splashviewbody.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorsManager.bluecolor,
      body: SplashViewbody(),
    );
  }
}
