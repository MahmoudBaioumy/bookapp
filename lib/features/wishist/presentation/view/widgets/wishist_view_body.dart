import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';
import 'package:bookapp/core/utils/serves_locator.dart';
import 'package:bookapp/core/utils/text_styles.dart';
import 'package:bookapp/core/widgets/custom_column_text_list_view.dart';
import 'package:bookapp/features/wishist/presentation/manager/show_wishlist_cubit/show_wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_Image_List_view.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../data/repo/wishlist_repo.dart';
import '../../manager/show_wishlist_cubit/show_wishlist_cubit.dart';
import 'custom_cart_wishist.dart';

class WishistViewBody extends StatelessWidget {
  const WishistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create:
          (context) =>
              ShowWishlistCubit(getit.get<wishlistRepoImple>())
                ..ShowWishlistBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStringsLanguage.wishistAppBarTitle.trans(),
            style: textStyle18(color: ColorsManager.white1color),
          ),
          leading: Icon(
            Icons.favorite_border,
            color: ColorsManager.white1color,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:BlocBuilder<ShowWishlistCubit, ShowWishlistState>(
              builder: (context, state) {
                final cubit = ShowWishlistCubit.get(context);
                final items = cubit.wishlistItems;

                /// في حالة فارغ المفضلة
                if (items.isEmpty) {
                  return Center(
                    child: Text(
                      AppStringsLanguage.emptyFav.trans(),
                      style: textStyle16(
                        color: ColorsManager.blackcolor,
                        fontsize: AppSize.s22,
                      ),
                    ),
                  );
                }

                /// في حالة وجود عناصر
                if (state is showWishlistLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is showWishlistFaluireState) {
                  return CustomErrorWidget(errMassage: state.errMassage);
                } else if (state is showWishlistSuccessState) {
                  return ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (context, index) => SizedBox(height: AppSize.s10),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final isFavorite = cubit.wishlistItems.any((e) => e.id == item.id);
                      return CustomCartWishist(
                        heigth: heigth,
                        width: width,
                        favourite: item,
                        onTapAddFav: () {
                          ShowWishlistCubit.get(context).removeItemFromWishlist(item.id ?? 0);
                          cubit.toggleFavorite(item);
                        },
                        isFavorite: isFavorite,
                      );
                    },
                  );
                } else {
                  /// التأكد من عدم ترك حالة بدون return
                  return Center(child: CircularProgressIndicator());
                }
              }

          ),

        ),
      ),
    );
  }
}
