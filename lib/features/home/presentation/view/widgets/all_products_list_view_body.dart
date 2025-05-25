import 'package:bookapp/features/home/data/models/all_prodtcus_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../data/models/best_seller_model.dart';

class AllProductsListViewBody extends StatelessWidget {
  const AllProductsListViewBody({
    super.key,
    required this.heigth,
    required this.weidth,
    this.allProducts,
  });

  final double heigth;
  final double weidth;
  final AllProducts? allProducts;

  // -------------------------- factory to Loading -------------------------- //
  factory AllProductsListViewBody.loading({
    required double heigth,
    required double weidth,
  }) {
    return AllProductsListViewBody(heigth: heigth, weidth: weidth, allProducts: null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment(-0.8, -0.9),
          children: [
            Container(
              height: heigth * 0.2,
              width: weidth * 0.29,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s10),
                image:
                allProducts?.image != null
                    ? DecorationImage(
                  image: NetworkImage(allProducts?.image ?? ''),
                  fit: BoxFit.cover,
                )
                    : null,
                color: allProducts?.image == null ? ColorsManager.greycolor : null,
              ),
            ),
            Container(
              height: 23,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s6),
                color: ColorsManager.bluecolor,
              ),
              child: Center(
                child: Text(
                  ('${allProducts?.discount}%').toString(),
                  style: textStyle10(
                    color: ColorsManager.white1color,
                    fontsize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSize.s3),
        SizedBox(
          height: heigth * 0.055,
          width: weidth * 0.3,
          child: Text(
            allProducts?.name ?? '    ',
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: textStyle18(color: ColorsManager.blackcolor, fontsize: 17),
          ),
        ),
        SizedBox(height: AppSize.s6),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s5),
          child: Text(
            allProducts?.category ?? '     ',
            style: textStyle18(color: ColorsManager.greycolor, fontsize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s28),
          child: Text(
            allProducts?.price ?? '      ',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              decorationColor: ColorsManager.greycolor,
              fontSize: 13,
              color: ColorsManager.greycolor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s28),
          child: Text(
            (allProducts?.priceAfterDiscount ??'     ' ).toString(),
            style: textStyle18(color: ColorsManager.bluecolor, fontsize: 15),
          ),
        ),
      ],
    );
  }
}
