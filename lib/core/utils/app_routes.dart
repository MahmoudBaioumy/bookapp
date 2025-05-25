import 'package:bookapp/features/auth/presentation/view/login_view.dart';
import 'package:bookapp/features/home/presentation/view/all_products_view.dart';
import 'package:bookapp/features/home/presentation/view/home_view.dart';
import 'package:bookapp/features/home/presentation/view/new_arrivals_details_view.dart';
import 'package:bookapp/features/home/presentation/view/new_arrivals_view.dart';
import 'package:bookapp/features/profile/presentation/view/widgets/edit_profile_view_body.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/view/signin_view.dart';
import '../../features/buttom_nav_bar/presentation/view/widgets/nav_bar_view.dart';
import '../../features/home/presentation/view/best_seller_details_view.dart';
import '../../features/home/presentation/view/best_seller_view.dart';
import '../../features/home/presentation/view/widgets/category_list_view.dart';
import '../../features/profile/presentation/view/widgets/lang_view.dart';
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
  static const kEditprofile = '/EditProfileViewBody';
  static const klangview = '/LangView';
  static const kbestSellerDetails = '/BestSellerDetilsView';
  static const knewArrivalsDetails = '/NewArrivalsDetailsView';
  static const kCategoriesView = '/CategoryListView';
  static const kallProductView = '/AllProductsView';

  // -------------------------- push to  pages -------------------------- //
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: KHomeView, builder: (context, state) => HomeView()),
      GoRoute(
        path: kLoginView,
        name: 'loginView',
        builder: (context, state) => LoginView(),
      ),
      GoRoute(path: ksignInView, builder: (context, state) => SigninView()),
      GoRoute(path: kallProductView, builder: (context, state) => AllProductsView()),
      GoRoute(path: kbottomnavView, builder: (context, state) => NavBarView()),
      GoRoute(
        path: kbestSellerView,
        builder: (context, state) => BestSellerView(),
      ),
      GoRoute(
        path: kNewArrivalsView,
        builder: (context, state) => NewArrivalsView(),
      ),
      GoRoute(
        path: kEditprofile,
        builder: (context, state) => EditProfileViewBody(),
      ),
      GoRoute(path: klangview, builder: (context, state) => LangView()),
      GoRoute(
        path: kbestSellerDetails,
        builder: (context, state) {
          final id = state.extra as int? ?? 0; // استخدام 'as int?' أو '?? 0' كقيمة افتراضية
          return BestSellerDetilsView(id: id);
        },
      ),
      GoRoute(
        path: knewArrivalsDetails,
        builder: (context, state) {
          final id = state.extra as int? ?? 0; // استخدام 'as int?' أو '?? 0' كقيمة افتراضية
          return NewArrivalsDetailsView(id: id);
        },
      ),
      GoRoute(
        path: kCategoriesView,
        builder: (context, state) {
          final id = state.extra as int? ?? 0; // استخدام 'as int?' أو '?? 0' كقيمة افتراضية
          return CategoryListView(id: id);
        },
      ),
    ],
  );
}
