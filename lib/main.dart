import 'package:bookapp/core/utils/serves_locator.dart';
import 'package:bookapp/features/home/data/repo/home_repo_impl.dart';
import 'package:bookapp/features/home/presentation/manager/all_products_cubit/all_products_cubit.dart';
import 'package:bookapp/features/home/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookapp/features/home/presentation/manager/categore_cubit/categories_cubit.dart';
import 'package:bookapp/features/home/presentation/manager/new_arrivels_cubit/new_arrvals_cubit.dart';
import 'package:bookapp/features/wishist/presentation/manager/show_wishlist_cubit/show_wishlist_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'core/utils/lang/codegen_loader.g.dart';
import 'core/utils/storage/cache_helper.dart';
import 'core/utils/them_manager.dart';
import 'core/utils/app_routes.dart';
import 'features/wishist/data/repo/wishlist_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServeslocator();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();

  runApp(

    EasyLocalization(
      // -------------------------- CodegenLoader this is handling the dire and trans -------------------------- //
      assetLoader: const CodegenLoader(),
      // -------------------------- choose the  lang in your app --------------------------//
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      // -------------------------- main lang when the app run -------------------------- //
      startLocale: Locale('en'),
      fallbackLocale: Locale('en'),
      // -------------------------- save the lang in locale -------------------------- //
      saveLocale: true,

      child: Bookly(),
  ),
  );
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(
          create:
              (context) =>
                  NewArrvalsCubit(getit.get<HomeRepoImpl>())
                    ..getNewArrivalsBooks(),
        ),
        BlocProvider(
          create:
              (context) =>
          AllProductsCubit( )
            ..getAllProducts(RequestTypes.init),
        ),
        BlocProvider(
          create:
              (context) =>
              BestSellerCubit(getit.get<HomeRepoImpl>())
                    ..getBestSellerBooks(),
        ),
        // BlocProvider(
        //   create:
        //       (context) => ShowWishlistCubit(getit.get<wishlistRepoImple>())..addItemToWishlist(id),
        // ),
        BlocProvider(
          create:
              (context) =>
          CategoriesCubit(getit.get<HomeRepoImpl>())
            ..getAllCategories(),
        ),
      ],
      child: MaterialApp.router(

        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(
        ),
        darkTheme: ThemeData(
            extensions: const [
               SkeletonizerConfigData(),
            ]
        ),
      ),
    );
  }
}
