import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../data/models/new_arrivals_model.dart';

class NewArrivalsListView extends StatelessWidget {
  const NewArrivalsListView({
    super.key,
    required this.heigth,
    required this.weidth,
    required this.product,
  });

  final double heigth;
  final double weidth;
  final ProductsNew? product;

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
                image: DecorationImage(
                  image: NetworkImage(product?.image ?? ''),
                  fit: BoxFit.cover,
                ),
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
                  ('${product?.discount}%').toString(),
                  style: textStyle10(
                    color: ColorsManager.white1color,
                    fontsize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSize.s6),
        SizedBox(
          height: heigth * 0.055,
          width: weidth * 0.3,
          child: Text(
            product?.name ?? '',
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: textStyle18(color: ColorsManager.blackcolor, fontsize: 17),
          ),
        ),
        SizedBox(height: AppSize.s3),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s5),
          child: Text(
            product?.category ?? '',
            style: textStyle18(color: ColorsManager.greycolor, fontsize: 16),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s28),
          child: Text(
            product?.price ?? '',
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
            (product?.priceAfterDiscount ?? 0).toString(),
            style: textStyle18(color: ColorsManager.bluecolor, fontsize: 15),
          ),
        ),
      ],
    );
  }
}
