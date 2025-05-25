import 'package:bookapp/features/home/presentation/view/widgets/home_view_body.dart';

import 'package:flutter/material.dart';



class HomeView extends StatelessWidget {
  HomeView({super.key});


  Widget build(BuildContext context) {
    return Scaffold(
        body: homeViewBody()
    );
  }
}
