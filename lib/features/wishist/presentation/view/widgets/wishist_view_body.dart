import 'package:bookapp/core/resources/text_styles.dart';
import 'package:bookapp/core/widgets/custom_column_text_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/string_manager.dart';
import '../../../../../core/resources/value_manager.dart';
import '../../../../../core/widgets/custom_Image_List_view.dart';
import 'custom_wishist_view_body.dart';

class WishistViewBody extends StatelessWidget {
  const WishistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringsManager.wishistAppBarTitle,
          style: textStyle18(color: ColorsManager.white1color),
        ),
        leading: Icon(Icons.favorite_border, color: ColorsManager.white1color),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return CustomWishistViewBody(heigth: heigth, width: width);
          },
          separatorBuilder: (context, index) => SizedBox(height: AppSize.s10),
          itemCount: 2,
        ),
      ),
    );
  }
}
