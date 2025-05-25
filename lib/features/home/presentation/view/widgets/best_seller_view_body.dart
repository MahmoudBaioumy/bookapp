import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/colors.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';
import 'package:bookapp/core/utils/serves_locator.dart';
import 'package:bookapp/core/utils/value_manager.dart';
import 'package:bookapp/features/cart/data/model/add_cart_model.dart';
import 'package:bookapp/features/cart/data/repo/cart_repo_imple.dart';
import 'package:bookapp/features/home/presentation/manager/best_seller_cubit/best_seller_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../cart/presentation/manager/cubit/cart_cubit.dart';
import '../../../../wishist/presentation/manager/show_wishlist_cubit/show_wishlist_cubit.dart';
import '../../../data/models/best_seller_model.dart';
import '../../manager/best_seller_cubit/best_seller_cubit.dart';
import 'custom_cart_best_seller_list_view.dart';

class BestSellerViewBody extends StatelessWidget {
  const BestSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery
        .of(context)
        .size
        .height;
    var weidth = MediaQuery
        .of(context)
        .size
        .width;
    return BlocProvider(
      create: (context) => CartCubit(getit.get<CartRepoImple>()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            title: AppStringsLanguage.bestSeller.trans(),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(AppPadding.p16),
          child: BlocBuilder<BestSellerCubit, BestSellerState>(
              builder: (context, state) {
                if (state is BestSellerSuccessState) {
                  return SizedBox.expand(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CustomCartBestSellerListView(
                          containerHeight: heigth,
                          containerWidth: weidth,
                          product: state.books.data?.products?[index],
                          onTapFavorite: () {

                          },
                          onTap: () {
                            // -------------------------- to get the book id -------------------------- //
                            var currentProductId =
                                state.books.data?.products?[index].id;
                            if (currentProductId != null &&
                                currentProductId != 0) {
                              GoRouter.of(context).push(
                                AppRouter.kbestSellerDetails,
                                extra: currentProductId, // استخدام الـ id الصحيح هنا
                              );
                            } else {
                              print('Invalid book ID');
                            }
                          },
                          onTapCart: () {
                            // -------------------------- to add the book to the cart  -------------------------- //
                            var currentProductId =
                                state.books.data?.products?[index].id;
                            if (currentProductId != null &&
                                currentProductId != 0) {
                              context.read<CartCubit>().AddCart(
                                  productId: currentProductId, quantity: 1);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      AppStringsLanguage.addedToCart.trans()),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
                        );
                      },
                      separatorBuilder:
                          (context, index) => SizedBox(height: AppSize.s10),
                      itemCount: state.books.data?.products?.length ?? 0,
                    ),
                  );
                } else if (state is BestSellerFailureState) {
                  return CustomErrorWidget(
                    errMassage: state.errMassage,
                    onRetry: () {
                      context.read<BestSellerCubit>().getBestSellerBooks();
                    },
                  );
                } else if (state is BestSellerLoadingState) {
                  {
                    return Skeletonizer(
                        enabled: true,
                        enableSwitchAnimation: true,
                        child: CustomCartBestSellerListView.loading(
                            containerHeight: heigth,
                            containerWidth: weidth)

                    );
                  }
                } else {
                  return Container();
                }
              }
          ),
        ),
      ),
    );
  }
}
