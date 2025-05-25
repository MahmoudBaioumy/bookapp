import 'package:bookapp/features/home/data/models/all_prodtcus_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_Image_List_view.dart';
import '../../../../../core/widgets/custom_column_text_list_view.dart';

class CustomCartAllProductsListView extends StatelessWidget {
  const CustomCartAllProductsListView({
    super.key,
    required this.containerHeight,
    required this.containerWidth,
    required this.products,
    this.onTap,
    this.onTapCart, this.onTapFavorite,
  });

  final double containerHeight;
  final double containerWidth;
  final AllProducts? products;
  final Function()? onTap;
  final Function()? onTapCart;
  final Function()? onTapFavorite;

// -------------------------- factory for loading -------------------------- //
  factory CustomCartAllProductsListView.loading({
    required double containerHeight,
    required double containerWidth,
  }) {
    return CustomCartAllProductsListView(
      containerHeight: containerHeight,
      containerWidth: containerWidth,
      products: null,
    );
  }
  @override
  Widget build(BuildContext context) {
    if (products == null) {
      return Container(
        height: containerHeight * 1,
        width: containerWidth * 1,
        margin: const EdgeInsets.symmetric(vertical: AppSize.s5),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        child: Row(
          children: [
            Container(
              height: containerHeight * 0.24,
              width: containerWidth * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(AppSize.s10),
              ),
            ),
            const SizedBox(width: AppSize.s10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 16, width: 100, color: Colors.grey[400]),
                  const SizedBox(height: AppSize.s8),
                  Container(height: 14, width: 80, color: Colors.grey[400]),
                  const SizedBox(height: AppSize.s8),
                  Container(height: 14, width: 120, color: Colors.grey[400]),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.favorite_border, color: Colors.grey[500]),
                Icon(Icons.shopping_cart_outlined, color: Colors.grey[500]),
              ],
            ),
            const SizedBox(width: AppSize.s10),
          ],
        ),
      );
    }else{
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: containerHeight * 0.24,
          width: containerWidth * 0.8,
          decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.greycolor),
            borderRadius: BorderRadius.circular(AppSize.s10),
          ),
          child: Row(
            children: [
              // الصورة
              Flexible(
                flex: 2,
                child: CustomImageListView(
                  heigth: containerHeight,
                  weidth: containerWidth,
                  Image: products?.image ?? '',
                  diss: '${products?.discount}%',
                ),
              ),

              SizedBox(width: 8), // مسافة صغيرة

              // تفاصيل الكتاب
              Flexible(
                flex: 3,
                child: CustomColumnTextListView(
                  heigth: containerHeight,
                  weidth: containerWidth,
                  bookname: products?.name ?? '',
                  booktype: products?.category ?? '',
                  booksalebeforediss: products?.price ?? '',
                  booksaleafterdiss: products?.priceAfterDiscount.toString()??'',
                  bookType: products?.category ?? '',
                ),
              ),

              SizedBox(width: 8),

              // الأزرار
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: onTapFavorite,
                    icon: Icon(
                      Icons.favorite_border,
                      color: ColorsManager.blackcolor,
                    ),
                  ),
                  IconButton(
                    onPressed: onTapCart,
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
}
