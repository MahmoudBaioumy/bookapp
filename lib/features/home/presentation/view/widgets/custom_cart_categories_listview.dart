import 'package:bookapp/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_Image_List_view.dart';
import '../../../../../core/widgets/custom_column_text_list_view.dart';
import '../../../data/models/categoires_model/categories_type_model.dart';

class CustomCartCategoriesListView extends StatelessWidget {
  const CustomCartCategoriesListView({
    super.key,
    required this.containerHeight,
    required this.containerWidth,
    required this.categories,
    this.onTap,
    this.onTapAddCart,
    this.onTapAddFavorite,
  });

  final double containerHeight;
  final double containerWidth;
  final Productscategories? categories;
  final Function()? onTap;
  final Function()? onTapAddCart;
  final Function()? onTapAddFavorite;

  // -------------------------- factory for loading -------------------------- //
  factory CustomCartCategoriesListView.loading({
    required double containerHeight,
    required double containerWidth,
  }) {
    return CustomCartCategoriesListView(
      containerHeight: containerHeight,
      containerWidth: containerWidth,
      categories: null, // Passing null as categories for loading state
    );
  }

  @override
  Widget build(BuildContext context) {
    if (categories == null) {
      // إذا كان المنتج غير موجود (أي أثناء التحميل)، نعرض Skeletonizer
      return Skeletonizer(
        enabled: true,
        enableSwitchAnimation: true,
        child: Container(
          height: containerHeight * 0.21,
          width: containerWidth * 0.8,
          decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.greycolor),
            borderRadius: BorderRadius.circular(AppSize.s10),
          ),
          child: Row(
            children: [
              CustomImageListView.loading(
                // عرض صورة مؤقتة أثناء التحميل
                heigth: containerHeight,
                weidth: containerWidth,
              ),
              CustomColumnTextListView.loading(
                // عرض نص مؤقت أثناء التحميل
                heigth: containerHeight,
                weidth: containerWidth,
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
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: containerHeight * 0.21,
          width: containerWidth * 0.8,
          decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.greycolor),
            borderRadius: BorderRadius.circular(AppSize.s10),
          ),
          child: Row(
            children: [
              CustomImageListView(
                heigth: containerHeight,
                weidth: containerWidth,
                Image: categories?.image ?? '',
                diss: '${categories?.discount}%',
              ),
              CustomColumnTextListView(
                heigth: containerHeight,
                weidth: containerWidth,
                bookname: categories?.name ?? '',
                booksalebeforediss: categories?.price ?? '',
                booksaleafterdiss:
                    categories?.priceAfterDiscount.toString() ?? '',
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
                    onPressed:onTapAddCart,
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
