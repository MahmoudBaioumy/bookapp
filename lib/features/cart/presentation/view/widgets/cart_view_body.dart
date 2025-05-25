import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/app_routes.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';
import 'package:bookapp/core/utils/serves_locator.dart';
import 'package:bookapp/core/widgets/custom_but.dart';
import 'package:bookapp/core/widgets/show_done_popup_dialog.dart';
import 'package:bookapp/features/cart/data/repo/cart_repo_imple.dart';
import 'package:bookapp/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:bookapp/features/cart/presentation/manager/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/value_manager.dart';
import 'custom_container_cart.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CartCubit(getit.get<CartRepoImple>())..getShowCart(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStringsLanguage.cartAppBarTitle.trans(),
            style: textStyle20(color: ColorsManager.white1color),
          ),
          leading: Icon(
            Icons.shopping_cart_outlined,
            color: ColorsManager.white1color,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppPadding.p10),
              child: BlocBuilder<CartCubit, CartStates>(
                builder: (context, state) {
                  var items =context.read<CartCubit>().showCartModel?.data?.cartItems ?? [];
                  if (items.isNotEmpty) {
                    return Column(
                      children: [
                        SizedBox(
                          height: heigth * 0.67,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return CustomContainerCart(
                                cartItems: items[index],
                                heigth: heigth,
                                width: width,
                                onpressed: () {
                                  var itemid = items[index].itemId;
                                  context.read<CartCubit>().removeCart(
                                    productId: itemid ?? 0,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        AppStringsLanguage.remove.trans(),
                                      ),
                                      backgroundColor: ColorsManager.redcolor,
                                    ),
                                  );
                                },
                              );
                            },
                            separatorBuilder:
                                (context, index) =>
                                    SizedBox(height: AppSize.s15),
                            itemCount: items.length,
                          ),
                        ),
                        SizedBox(height: AppSize.s20),
                        BlocBuilder<CartCubit, CartStates>(
                          builder: (context, state) {
                            var total = double.tryParse(context.read<CartCubit>().showCartModel
                                ?.data?.total.toString() ?? '0.0',) ?? 0.0;
                            return CustomButton(
                              text: 'Checkout: \$${(total).toStringAsFixed(2)}',
                              onPressed: () async {
                                bool confirmed = await showConfirmationDialog(
                                  title:AppStringsLanguage.titleOfDonePopUp.trans(),
                                  content:AppStringsLanguage.contentOfDonePopUp.trans(),
                                  confirmText:AppStringsLanguage.confirmTextOfDonePopUp.trans(),
                                  cancelText:AppStringsLanguage.cancelTextOfDonePopUp.trans(),
                                  context: context,
                                );
                                if (confirmed) {
                                  showSuccessMessage(
                                    context: context,
                                    titel:AppStringsLanguage.titleOfEndingPopUp.trans(),
                                    contant:AppStringsLanguage.contentOfEndingPopUp.trans(),
                                    Ok:AppStringsLanguage.confirmTextOfDonePopUp.trans(),
                                  );
                                } else {
                                  print('لم يتم تأكيد الاوردر');
                                }
                              },

                              height: AppSize.s60,
                            );
                          },
                        ),
                      ],
                    );
                  } else if (state is ShowCartFailureState) {
                    return Text(state.errMassage);
                  } else if (state is ShowCartLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.bluecolor,
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        AppStringsLanguage.emptycart.trans(),
                        style: textStyle16(
                          color: ColorsManager.blackcolor,
                          fontsize: AppSize.s22,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
