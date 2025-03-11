import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/value_manager.dart';
import '../../../../../core/widgets/custom_Image_List_view.dart';
import '../../../../../core/widgets/custom_column_text_list_view.dart';

class CustomContainerNewArrivalsListVew extends StatelessWidget {
  const CustomContainerNewArrivalsListVew({
    super.key,
    required this.heigth,
    required this.weidth,
  });

  final double heigth;
  final double weidth;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Image: AssetsManager.cross3,
            diss: '40 %',
          ),
          CustomColumnTextListView(
            heigth: heigth,
            weidth: weidth,
            bookname: 'Clean Architecture',
            booktype: 'Software',
            booksalebeforediss: '189.00 L.E',
            booksaleafterdiss: '170.00 L.E',
          ),
          Spacer(),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: ColorsManager.blackcolor,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: ColorsManager.blackcolor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}