import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_Image_List_view.dart';
import '../../../data/model/show_cart_model.dart';

class CustomContainerCart extends StatelessWidget {
  const CustomContainerCart({
    super.key,
    required this.heigth,
    required this.width,
    required this.cartItems,
    this.onpressed,
  });

  final double heigth;
  final double width;
  final CartItems cartItems;
  final Function()? onpressed;
@override
Widget build(BuildContext context) {
  return Container(
    height: heigth * 0.20,
    width: width * 0.97,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppSize.s18),
      border: Border.all(color: ColorsManager.greycolor),
    ),
    child: Row(
      children: [
        CustomImageListView(
          Image:cartItems.itemProductImage?? '',
          diss: cartItems.itemProductDiscount.toString()??'',
          heigth: heigth,
          weidth: width,
        ),
        SizedBox(width: width * 0.03),
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.45,
                child: Text(
                  cartItems.itemProductName??'',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle16(color: ColorsManager.greycolor),
                ),
              ),
              SizedBox(height: AppSize.s20),
              Container(
                height: heigth * 0.04,
                width: width * 0.27,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.greycolor),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: AppPadding.p14),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.add, size: 16,
                            color: ColorsManager.greycolor),
                      ),
                      SizedBox(width: AppSize.s15,),
                      Text(
                        cartItems.itemQuantity.toString()??'',
                        style: textStyle18(color: ColorsManager.greycolor),
                      ),
                      SizedBox(width: AppSize.s15,),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.remove, size: 16,
                            color: ColorsManager.greycolor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppApadding.p22),
          child: Column(
            children: [
              IconButton(
                onPressed: onpressed,
                icon: Icon(Icons.delete),
                color: ColorsManager.redcolor,
              ),
              SizedBox(height: AppSize.s12),
              SizedBox(
                width: width * 0.15,
                child: Text(
                  cartItems.itemProductPrice.toString()??'',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: ColorsManager.greycolor,
                    fontSize: AppSize.s12,
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.15,
                child: Text(
                  cartItems.itemProductPriceAfterDiscount.toString()??'',
                  style: TextStyle(
                    color: ColorsManager.bluecolor,
                    fontSize: AppSize.s12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}}
