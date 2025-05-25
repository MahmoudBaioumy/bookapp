import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_Image_List_view.dart';
import '../../../../../core/widgets/custom_column_text_list_view.dart';
import '../../../data/models/new_arrivals_model.dart';

class CustomCartNewArrivalsListVew extends StatelessWidget {
  const CustomCartNewArrivalsListVew({
    super.key,
    required this.heigth,
    required this.weidth,
    this.product,
    this.onTap,
    this.onTapAddCart,
    this.onTapAddFavorite,
  });

  final double heigth;
  final double weidth;
  final ProductsNew? product;
  final Function()? onTap;
  final Function()? onTapAddCart;
  final Function()? onTapAddFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heigth * 0.21,
        width: weidth * 0.8,
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.greycolor),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        child: Row(
          children: [
            CustomImageListView(
              heigth: heigth,
              weidth: weidth,
              Image: product?.image ?? '',
              diss: '${product?.discount}%',
            ),
            CustomColumnTextListView(
              heigth: heigth,
              weidth: weidth,
              bookname: product?.name ?? '',
              booktype: product?.category ?? '',
              booksalebeforediss: product?.price ?? '',
              booksaleafterdiss: product?.priceAfterDiscount.toString() ?? '',
            ),
            Spacer(),
            Column(
              children: [
                IconButton(
                  onPressed: onTapAddFavorite,
                  icon: Icon(
                    Icons.favorite_border,
                    color: ColorsManager.blackcolor,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: onTapAddCart,
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: ColorsManager.blackcolor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
