import 'dart:async';
import 'package:bookapp/core/extension/internet_checker.dart';
import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/colors.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';
import 'package:bookapp/core/utils/value_manager.dart';
import 'package:bookapp/core/widgets/custom_error_widget.dart';
import 'package:bookapp/features/home/presentation/manager/all_products_cubit/all_products_cubit.dart';
import 'package:bookapp/features/home/presentation/manager/all_products_cubit/all_products_state.dart';
import 'package:bookapp/features/home/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookapp/features/home/presentation/manager/best_seller_cubit/best_seller_state.dart';
import 'package:bookapp/features/home/presentation/manager/categore_cubit/categories_cubit.dart';
import 'package:bookapp/features/home/presentation/manager/categore_cubit/categories_state.dart';
import 'package:bookapp/features/home/presentation/manager/new_arrivels_cubit/new_arrvals_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/serves_locator.dart';
import '../../../../../core/widgets/custom_colum_Internet_connection_off.dart';
import '../../../data/repo/home_repo_impl.dart';
import 'all_products_list_view_body.dart';
import 'best_seller_list_view.dart';
import 'category_body_build.dart';
import 'home_header_build.dart';
import 'carousel_slider_build.dart';
import 'list_view_title_row.dart';
import 'new_arrivals_list_view.dart';

class homeViewBody extends StatefulWidget {
  const homeViewBody({super.key});

  @override
  State<homeViewBody> createState() => _homeViewBodyState();
}

class _homeViewBodyState extends State<homeViewBody> {
 late AllProductsCubit allProductsCubit =BlocProvider.of<AllProductsCubit>(context);

  @override
  void initState() {
    super.initState();
    NetworkChecker.checkInternetAndExecute(
      context: context,
      apiCall: () => allProductsCubit.getAllProducts(
        RequestTypes.init
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var weidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homeHeaderbuild(),
              SizedBox(height: AppSize.s20),
              CarouselSliderBuild(),
              SizedBox(height: AppSize.s16),
              SizedBox(height: AppSize.s5),
              // -------------------------- ListView of AllProduct -------------------------- //
              ListViewTitleRow(
                Title: AppStringsLanguage.allProduct.trans(),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kallProductView);
                },
              ),
              SizedBox(height: AppSize.s10,),
              BlocBuilder<AllProductsCubit, AllProductsState>(
                builder: (context, state) {
                  if (state is AllProductsSuccessState) {
                    return SizedBox(
                      height: heigth * 0.35,
                      child: ListView.separated(
                        itemCount:
                            state.allProdtcusModel.data?.products?.length ?? 0,
                        itemBuilder: (context, index) {
                          return AllProductsListViewBody(
                            heigth: heigth,
                            weidth: weidth,
                            allProducts: state.allProdtcusModel.data?.products?[index],
                          );
                        },
                        separatorBuilder:
                            (context, index) => SizedBox(width: AppSize.s14),
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  } else if (state is AllProductsFailureState) {
                        return CustomErrorWidget(errMassage: state.errorMassage);
                      } else {
                        return CircularProgressIndicator();

                      }
                },
              ),
              SizedBox(height: AppSize.s10,),
              ListViewTitleRow(
                Title: AppStringsLanguage.bestSeller.trans(),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kbestSellerView);
                },
              ),
              SizedBox(height: AppSize.s5),
              // -------------------------- ListView of bestseller -------------------------- //
              BlocBuilder<BestSellerCubit, BestSellerState>(
                builder: (context, state) {
                  if (state is BestSellerSuccessState) {
                    return SizedBox(
                      height: heigth * 0.35,
                      child: ListView.separated(
                        itemCount: state.books.data?.products?.length ?? 0,
                        itemBuilder: (context, index) {
                          return BestSellerListView(
                            heigth: heigth,
                            weidth: weidth,
                            product: state.books.data?.products?[index],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(width: AppSize.s14),
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  } else if (state is BestSellerFailureState) {
                    return CustomErrorWidget(errMassage: state.errMassage);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
             // -------------------------- ListView of category -------------------------- //
              SizedBox(height: AppSize.s10,),
              ListViewTitleRow(Title: AppStringsLanguage.category.trans()),
              SizedBox(height: AppSize.s8),
              SizedBox(
                height: heigth * 0.14,
                child: BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    if (state is CategoriesSuccess) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return CategoryBodyBuild(
                            titel: state.books.data?.categories?[index].name ?? '',
                            onTap: () {
                              print(state.books.data?.categories?[index].id);
                              if (state.books.data?.categories?[index].id != null &&
                                  state.books.data?.categories?[index].id !=
                                      0) {
                                GoRouter.of(context).push(
                                  AppRouter.kCategoriesView,
                                  extra: state.books.data?.categories?[index].id,
                                );
                              }
                              else if (state is CategoriesLoading) {
                                Skeletonizer(
                                  enabled: true,
                                  child: ListView.builder(
                                    itemCount: 6,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return CategoryBodyBuild.loading(titel: '     ');
                                    },
                                  ),
                                );
                              }
                              else {
                                print('Invalid book ID dsadasdasd');
                              }
                            },
                          );
                        },
                        separatorBuilder:
                            (context, index) => SizedBox(width: AppSize.s14),
                        itemCount: state.books.data?.categories?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                      );
                    } else if (state is CategoriesFailure) {
                      return CustomErrorWidget(errMassage: state.errmassage);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              SizedBox(height: AppSize.s10,),
            //  -------------------------- ListView of NewArrivals -------------------------- //
              ListViewTitleRow(
                Title: AppStringsLanguage.newArrivals.trans(),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kNewArrivalsView);
                },
              ),
              SizedBox(height: AppSize.s8),
              SizedBox(
                height: heigth * 0.35,
                child: BlocBuilder<NewArrvalsCubit, NewArrivalsState>(
                  builder: (context, state) {
                    if (state is NewArrivalsSuccess) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return NewArrivalsListView(
                            heigth: heigth,
                            weidth: weidth,
                            product: state.Books.data?.products?[index],
                          );
                        },
                        separatorBuilder:
                            (context, index) => SizedBox(width: AppSize.s14),
                        itemCount: state.Books.data?.products?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                      );
                    } else if (state is NewArrivalsFailure) {
                      return Center(
                        child: CustomErrorWidget(
                          errMassage: state.errMessage,
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
