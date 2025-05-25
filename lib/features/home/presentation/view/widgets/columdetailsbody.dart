import 'package:bookapp/core/extension/translate.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/lang/string_language_manager.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_but.dart';

class ColumDetailsBody extends StatelessWidget {
  const ColumDetailsBody({
    super.key,
    required this.titel,
     this.type,
    required this.pricebeforeDiss,
    required this.priceAfterDiss,
    required this.diescription,
    required this.iamge, this.AddCart,
  });

  @override
  final String titel;
  final String iamge;
  final String? type;
  final String pricebeforeDiss;
  final String priceAfterDiss;
  final String diescription;
  final Function()? AddCart;

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSize.s40),
                  bottomRight: Radius.circular(AppSize.s40),
                ),
                image: DecorationImage(
                  image: NetworkImage(iamge),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: ColorsManager.bluecolor),
            ),
          ],
        ),
        SizedBox(height: AppSize.s20),
        Padding(
          padding: const EdgeInsets.only(left: AppSize.s30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.s50,
                width: AppWidth.w400,
                child: Text(
                  titel,
                  maxLines: 1,
                  style: textStyle30(
                    color: ColorsManager.blackcolor,
                    fontsize: AppSize.s35,
                  ),
                ),
              ),
              SizedBox(height: AppSize.s8),
              Row(
                children: [
                  Text(
                    type??'',
                    style: textStyle16(
                      color: ColorsManager.greycolor,
                      fontsize: AppSize.s18,
                    ),
                  ),
                  Spacer(),
                  //  SizedBox(width: AppSize.s80,),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Text(
                          pricebeforeDiss,
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: ColorsManager.greycolor,
                          ),
                        ),
                        Text(
                          priceAfterDiss,
                          style: textStyle14(color: ColorsManager.bluecolor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.s30),
              Text(
                AppStringsLanguage.productDetilDescription.trans(),
                style: textStyle20(color: ColorsManager.blackcolor),
              ),
              SizedBox(height: AppSize.s10),
              Padding(
                padding: const EdgeInsets.only(right: AppSize.s16),
                child: Text(
                  diescription,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle12(
                    color: ColorsManager.greycolor,
                    fontsize: AppSize.s18,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSize.s40),
        CustomButton(
          text: AppStringsLanguage.addToCart.trans(),
          onPressed: AddCart??(){},
          height: AppSize.s60,
          radius: AppSize.s30,
          width: AppWidth.w400,
          // width: ,
        ),
      ],
    );
  }
}
