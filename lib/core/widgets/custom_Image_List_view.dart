import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_styles.dart';
import '../utils/value_manager.dart';

class CustomImageListView extends StatelessWidget {
  const CustomImageListView({
    super.key,
    required this.heigth,
    required this.weidth,
    required this.Image,
    required this.diss,
  });
  final double heigth;
  final double weidth;
  final String Image;
  final String diss;
  // -------------------------- factory for loading -------------------------- //
  factory CustomImageListView.loading({
    required double heigth,
    required double weidth,
  }) {
    return CustomImageListView(
      heigth: heigth,
      weidth: weidth,
      Image: '',
      diss: '0%',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(-0.6, -0.8),
      children: [
        Container(
          margin: EdgeInsets.all(AppMargin.m8),
          height: heigth * 0.18,
          width: weidth * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s10),
            image:
                Image.isNotEmpty
                    ? DecorationImage(
                      image: NetworkImage(Image),
                      fit: BoxFit.cover,
                    )
                    : null,
            color: Image.isEmpty ? Colors.grey : null,
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
            child: SizedBox.expand(
              child: Text(
                diss,
                textAlign: TextAlign.center,
                style: textStyle10(
                  color: ColorsManager.white1color,
                  fontsize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
