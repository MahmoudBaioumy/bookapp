import 'package:bookapp/core/utils/colors.dart';
import 'package:bookapp/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../data/models/categoires_model/categories_type_model.dart';

class CategoryBodyBuild extends StatelessWidget {
  const CategoryBodyBuild({
    super.key,
    required this.titel,
    this.onTap,
    this.productscategories,
    this.isLoading = false,
  });

  factory CategoryBodyBuild.loading({required String titel}) {
    return CategoryBodyBuild(titel: titel, isLoading: true);
  }

  @override
  final void Function()? onTap;
  final String titel;
  final Productscategories? productscategories;
  final bool isLoading;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              color: isLoading ? Colors.grey[300] : Colors.grey[500],
              borderRadius: BorderRadius.circular(AppSize.s10),
            ),
          ),
          Container(
            height: AppSize.s90,
            width: AppSize.s90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s10),
            ),
          ),
          if(!isLoading)
          SizedBox(
            height: AppSize.s90,
            width: AppSize.s90,
            child: Padding(
              padding: const EdgeInsets.only(
                top: AppSize.s30,
                left: AppSize.s5,
              ),
              child: Text(
                titel,
                style: textStyle14(
                  color: ColorsManager.white1color,
                  fontsize: AppSize.s20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
