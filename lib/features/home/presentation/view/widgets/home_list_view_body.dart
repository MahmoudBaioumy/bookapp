import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/value_manager.dart';

class homeListViewBody extends StatelessWidget {
  const homeListViewBody({
    super.key,
    required this.heigth,
    required this.weidth,
    required this.image,
    required this.bookName,
    required this.type,
    required this.sallaryBeforeDiss,
    required this.sallaryAftarDiss,
    required this.diss,
  });

  final double heigth;
  final double weidth;
  final String? image;
  final String? bookName;
  final String? type;
  final String? sallaryBeforeDiss;
  final String? sallaryAftarDiss;
  final String? diss;

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
                  image: NetworkImage(image ?? ''),
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
                child: Expanded(
                  child: Text(
                    diss ?? '',
                    style: textStyle10(
                      color: ColorsManager.white1color,
                      fontsize: 14,
                    ),
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
            bookName ?? '',
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: textStyle18(color: ColorsManager.blackcolor, fontsize: 17),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s28),
          child: Text(
            type ?? '',
            style: textStyle18(color: ColorsManager.greycolor, fontsize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s28),
          child: Text(
            sallaryBeforeDiss ?? '',
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
            sallaryAftarDiss ?? "",
            style: textStyle18(color: ColorsManager.bluecolor, fontsize: 15),
          ),
        ),
      ],
    );
  }
}
