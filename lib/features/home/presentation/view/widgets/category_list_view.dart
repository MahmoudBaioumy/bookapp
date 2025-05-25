import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/features/home/data/repo/home_repo_impl.dart';
import 'package:bookapp/features/home/presentation/manager/categore_cubit/categories_cubit.dart';
import 'package:bookapp/features/home/presentation/manager/categore_cubit/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/lang/string_language_manager.dart';
import '../../../../../core/utils/serves_locator.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../cart/data/repo/cart_repo_imple.dart';
import '../../../../cart/presentation/manager/cubit/cart_cubit.dart';
import 'custom_cart_categories_listview.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key, required this.id});

  @override
  final int id;

  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var weidth = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  CategoriesCubit(getit.get<HomeRepoImpl>())
                    ..fetchBookCategory(id),
        ),
        BlocProvider(
          create: (context) => CartCubit(getit.get<CartRepoImple>()),
        ),
      ],
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              return CustomAppBar(
                title:
                    state is CategoiresTypeSuccess
                        ? state.bookList.data?.name ?? ''
                        : '',
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(AppPadding.p16),
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoiresTypeSuccess) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return CustomCartCategoriesListView(
                      containerHeight: heigth,
                      containerWidth: weidth,
                      categories: state.bookList.data?.products?[index],
                      onTapAddCart: () {
                        var currentProductId =
                            state.bookList.data?.products?[index].id;
                        if (currentProductId != null && currentProductId != 0) {
                          context.read<CartCubit>().AddCart(
                            productId: currentProductId,
                            quantity: 1,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                AppStringsLanguage.addedToCart.trans(),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                    );
                  },
                  separatorBuilder:
                      (context, index) => SizedBox(height: AppSize.s10),
                  itemCount: state.bookList.data?.products?.length ?? 0,
                );
              } else if (state is categorieTypeFailure) {
                return CustomErrorWidget(
                  errMassage: state.errmassage,
                  // onRetry: () {
                  //   context.read<CategoriesCubit>().fetchBookCategory(id);
                  // },
                );
              } else {
                return Skeletonizer(
                  enabled: true,
                  enableSwitchAnimation: true,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CustomCartCategoriesListView.loading(
                        containerHeight: heigth,
                        containerWidth: weidth,
                      );
                    },
                    separatorBuilder:
                        (context, index) => SizedBox(height: AppSize.s10),
                    itemCount: 6, // عدد العناصر التي يتم عرضها أثناء التحميل
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
