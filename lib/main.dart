
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


import 'constants.dart';
import 'core/resources/app_routes.dart';
import 'core/resources/them_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      );

  }
}