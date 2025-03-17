import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_Image_List_view.dart';
import 'custom_container_cart.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringsManager.cartAppBarTitle,
          style: textStyle20(color: ColorsManager.white1color),
        ),
        leading: Icon(
          Icons.shopping_cart_outlined,
          color: ColorsManager.white1color,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p10),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return CustomContainerCart(heigth: heigth, width: width);
          },
          separatorBuilder: (context, index) => SizedBox(height: AppSize.s10),
          itemCount: 2,
        ),
      ),
    );
  }
}
