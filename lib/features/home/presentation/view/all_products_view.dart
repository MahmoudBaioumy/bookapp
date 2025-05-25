import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/colors.dart';
import 'package:bookapp/features/home/presentation/manager/all_products_cubit/all_products_cubit.dart';
import 'package:bookapp/features/home/presentation/manager/all_products_cubit/all_products_state.dart';
import 'package:bookapp/features/home/presentation/view/widgets/custom_cart_all_products.dart';
import 'package:bookapp/features/home/presentation/view/widgets/custom_cart_best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/lang/string_language_manager.dart';
import '../../../../core/utils/serves_locator.dart';
import '../../../../core/utils/value_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../cart/data/repo/cart_repo_imple.dart';
import '../../../cart/presentation/manager/cubit/cart_cubit.dart';
import '../manager/best_seller_cubit/best_seller_cubit.dart';
import '../manager/best_seller_cubit/best_seller_state.dart';

class AllProductsView extends StatefulWidget {
  const AllProductsView({super.key});

  @override
  State<AllProductsView> createState() => _AllProductsViewState();
}

class _AllProductsViewState extends State<AllProductsView> {
  final ScrollController? _controller=ScrollController();
  late AllProductsCubit allProductsCubit =BlocProvider.of<AllProductsCubit>(context) ;

  @override
  void initState() {
    _controller?.addListener(() {
      print(_controller.offset);
      if(_controller.offset==_controller.position.maxScrollExtent){
        /// add pagination request

        allProductsCubit.getAllProducts(RequestTypes.pagination);

      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var weidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CartCubit(getit.get<CartRepoImple>()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            title: AppStringsLanguage.allProduct.trans(),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(AppPadding.p16),
          child: BlocBuilder<AllProductsCubit, AllProductsState>(
              builder: (context, state) {
                if (state is AllProductsSuccessState||state is AllProductsLoadingState) {
                  return SingleChildScrollView(
                    controller:_controller ,
                    child: Column(
                     spacing: AppSize.s30,
                      children: [
                        ...List.generate(
                            allProductsCubit.allProductsModel?.data?.products?.length ?? 0,
                            (index) => CustomCartAllProductsListView(
                              containerHeight: heigth,
                              containerWidth: weidth,
                              products: allProductsCubit.allProductsModel?.data?.products?[index],
                              onTap: () {
                                // -------------------------- to get the book id -------------------------- //
                                var currentProductId = allProductsCubit.allProductsModel?.data?.products?[index].id;
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
                                    allProductsCubit.allProductsModel?.data?.products?[index].id;
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
                            )),
                        // Flexible(
                        //   child: ListView.builder(
                        //     controller: _controller,
                        //     itemBuilder: (context, index) {
                        //       return CustomCartAllProductsListView(
                        //         containerHeight: heigth,
                        //         containerWidth: weidth,
                        //         products: state.allProdtcusModel.data?.products?[index],
                        //         onTap: () {
                        //           // -------------------------- to get the book id -------------------------- //
                        //           var currentProductId =
                        //               state.allProdtcusModel.data?.products?[index].id;
                        //           if (currentProductId != null &&
                        //               currentProductId != 0) {
                        //             GoRouter.of(context).push(
                        //               AppRouter.kbestSellerDetails,
                        //               extra: currentProductId, // استخدام الـ id الصحيح هنا
                        //             );
                        //           } else {
                        //             print('Invalid book ID');
                        //           }
                        //         },
                        //         onTapCart: () {
                        //           // -------------------------- to add the book to the cart  -------------------------- //
                        //           var currentProductId =
                        //               state.allProdtcusModel.data?.products?[index].id;
                        //           if (currentProductId != null &&
                        //               currentProductId != 0) {
                        //             context.read<CartCubit>().AddCart(
                        //                 productId: currentProductId, quantity: 1);
                        //             ScaffoldMessenger.of(context).showSnackBar(
                        //               SnackBar(
                        //                 content: Text(
                        //                     AppStringsLanguage.addedToCart.trans()),
                        //                 backgroundColor: Colors.green,
                        //               ),
                        //             );
                        //           }
                        //         },
                        //       );
                        //     },
                        //     // separatorBuilder:
                        //     //     (context, index) => SizedBox(height: AppSize.s10),
                        //     itemCount: state.allProdtcusModel.data?.products?.length ?? 0,
                        //   ),
                        // ),
                        if(allProductsCubit.allProductsModel!=null&&
                            state is AllProductsLoadingState
                        )
                        CircularProgressIndicator(
                          color: ColorsManager.bluecolor,
                        )
                      ],
                    ),
                  );
                }
                else if (state is AllProductsFailureState) {
                  return CustomErrorWidget(
                    errMassage: state.errorMassage,
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
