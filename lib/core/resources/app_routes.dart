import 'package:bookapp/features/auth/presentation/view/login_view.dart';
import 'package:bookapp/features/home/presentation/view/home_view.dart';
import 'package:bookapp/features/home/presentation/view/new_arrivals_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/view/signin_view.dart';

import '../../features/buttom_nav_bar/presentation/view/widgets/nav_bar_view.dart';
import '../../features/home/presentation/view/best_seller_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

// ========================== 🔥 AppRouter to handling pages push 🔥 ========================== //

abstract class AppRouter {
  // -------------------------- name of pages -------------------------- //
  static const KHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kLoginView = '/loginView';
  static const ksignInView = '/signiInView';
  static const kbottomnavView = '/NavBarView';
  static const kbestSellerView = '/BestSellerView';
  static const kNewArrivalsView = '/NewArrivalsView';

  // -------------------------- push to  pages -------------------------- //
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: KHomeView, builder: (context, state) => HomeView()),
      GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
      GoRoute(path: ksignInView, builder: (context, state) => SigninView()),
      GoRoute(path: kbottomnavView, builder: (context, state) => NavBarView()),
      GoRoute(
        path: kbestSellerView,
        builder: (context, state) => BestSellerView(),
      ),GoRoute(
        path: kNewArrivalsView,
        builder: (context, state) => NewArrivalsView(),
      ),
    ],
  );
}
