import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_styles.dart';
import '../utils/value_manager.dart';

class CustomColumnTextListView extends StatelessWidget {
  const CustomColumnTextListView({
    super.key,
    required this.heigth,
    required this.weidth,
    required this.bookname,
     this.booktype,
     this.booksalebeforediss,
    required this.booksaleafterdiss,
    this.bookType,
  });
final String? bookType;
  final double heigth;
  final double weidth;
  final String bookname;
  final String? booktype;
  final String? booksalebeforediss;
  final String booksaleafterdiss;

  // -------------------------- factory for loading -------------------------- //
  factory CustomColumnTextListView.loading({
    required double heigth,
    required double weidth,
  }) {
    return CustomColumnTextListView(
      heigth: heigth,
      weidth: weidth,
      bookname: 'Loading...',
      booksalebeforediss: 'Loading...',
      booksaleafterdiss: 'Loading...',
      bookType: 'Loading',
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppPadding.p10),
      child:  Flexible(
        child: Column(
          children: [
            SizedBox(
              height: heigth * 0.055,
              width: weidth * 0.3,
              child: Text(
                bookname,
                //   '',
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: textStyle18(color: ColorsManager.blackcolor, fontsize: 17),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s26),
              child: Text(
                booktype??'',
                style: textStyle18(color: ColorsManager.greycolor, fontsize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s26),
              child: Text(
                booksalebeforediss??'',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: ColorsManager.greycolor,
                  fontSize: 13,
                  color: ColorsManager.greycolor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s26),
              child: Text(
                booksaleafterdiss,
                style: textStyle18(color: ColorsManager.bluecolor, fontsize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s26),
              child: Text(
                bookType ??'',
                style: textStyle18(color: ColorsManager.bluecolor, fontsize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
