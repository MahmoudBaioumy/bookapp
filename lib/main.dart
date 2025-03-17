import 'package:bookapp/core/utils/serves_locator.dart';
import 'package:bookapp/features/home/data/repo/home_repo_impl.dart';
import 'package:bookapp/features/home/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'constants.dart';
import 'core/utils/them_manager.dart';
import 'core/utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              BestSellerCubit(getit.get<HomeRepoImpl>())..getBestSellerBooks(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(),
      ),
    );
  }
}
