import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/text_styles.dart';
import '../../../../../core/resources/value_manager.dart';
import '../../../../../core/widgets/custom_Image_List_view.dart';

class CustomContainerCart extends StatelessWidget {
  const CustomContainerCart({
    super.key,
    required this.heigth,
    required this.width,
  });

  final double heigth;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth * 0.19,
      width: width * 0.99,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s18),
        border: Border.all(color: ColorsManager.greycolor),
      ),
      child: Row(
        children: [
          CustomImageListView(
            Image: AssetsManager.cross3,
            diss: '40 %',
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
                    'Algorithm Programming',
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
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        color: ColorsManager.greycolor,
                      ),
                      Text(
                        '1',
                        style: textStyle18(color: ColorsManager.greycolor),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove),
                        color: ColorsManager.greycolor,
                      ),
                    ],
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
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  color: ColorsManager.redcolor,
                ),
                SizedBox(height: AppSize.s12),
                SizedBox(
                  width: width * 0.15,
                  child: Text(
                    '279.00 L.E',
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
                    '150.00 L.E',
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
  }
}