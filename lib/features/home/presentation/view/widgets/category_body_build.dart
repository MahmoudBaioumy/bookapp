import 'package:bookapp/core/resources/colors.dart';
import 'package:bookapp/core/resources/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/value_manager.dart';

class CategoryBodyBuild extends StatelessWidget {
  const CategoryBodyBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(AppSize.s10),
            ),
          ),
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s10),
            image: DecorationImage(image: AssetImage(AssetsManager.cross3),fit: BoxFit.fill,)
            ),
          ),
          SizedBox(
            height: 80,
            width: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: AppSize.s30, left: AppSize.s5),
              child: Text(
                'Software',
                style: textStyle14(
                  color: ColorsManager.white1color,
                  fontsize: AppSize.s18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
