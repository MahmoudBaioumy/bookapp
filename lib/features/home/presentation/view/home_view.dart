import 'package:bookapp/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

import '../../data/models/best_seller_model.dart/best_seller_model.dart' as bs;

class HomeView extends StatelessWidget {
  HomeView({super.key});

  Widget build(BuildContext context) {
    return Scaffold(body: homeViewBody());
  }
}
