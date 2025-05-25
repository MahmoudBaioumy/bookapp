import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';
import 'package:bookapp/features/home/presentation/manager/new_arrivels_cubit/new_arrvals_cubit.dart';
import 'package:bookapp/features/home/presentation/view/widgets/custom_cart_new_arrivals_list_vew.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/serves_locator.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../cart/data/repo/cart_repo_imple.dart';
import '../../../../cart/presentation/manager/cubit/cart_cubit.dart';

class NewArrivalsViewBody extends StatelessWidget {
  const NewArrivalsViewBody({super.key});

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
          title: AppStringsLanguage.newArrivals.trans(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p16),
        child: BlocBuilder<NewArrvalsCubit, NewArrivalsState>(
          builder: (context, state) {
            if (state is NewArrivalsSuccess) {
              return SizedBox.expand(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CustomCartNewArrivalsListVew(
                      heigth: heigth,
                      weidth: weidth,
                      product: state.Books.data?.products?[index],
                      onTap: () {
                        var BookId = state.Books.data?.products?[index]?.id;
                        if (BookId != null && BookId != 0) {
                          GoRouter.of(context).push(
                            AppRouter.knewArrivalsDetails,
                            extra: BookId, // استخدام الـ id الصحيح هنا
                          );
                        } else {
                          print('Invalid book ID');
                        }
                      },
                      onTapAddCart: () {
                        var currentProductId =
                            state.Books.data?.products?[index].id;
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
                  itemCount: state.Books.data?.products?.length ?? 0,
                ),
              );
            } else if (state is NewArrivalsFailure) {
              return CustomErrorWidget(errMassage: state.errMessage);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    ),
);
  }
}
