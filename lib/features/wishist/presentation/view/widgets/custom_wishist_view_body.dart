import 'package:flutter/material.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_Image_List_view.dart';
import '../../../../../core/widgets/custom_column_text_list_view.dart';

class CustomWishistViewBody extends StatelessWidget {
  const CustomWishistViewBody({
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
            padding: const EdgeInsets.only(top: AppPadding.p10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomColumnTextListView(
                  heigth: heigth,
                  weidth: width,
                  bookname: 'Clean Architecture',
                  booktype: 'Software',
                  booksalebeforediss: '189.00 L.E',
                  booksaleafterdiss: '170.00 L.E',
                ),
              ],
            ),
          ),
          SizedBox(width: width * 0.18),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite),
                color: ColorsManager.bluecolor,
              ),

              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_shopping_cart_rounded),
                color: ColorsManager.blackcolor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
