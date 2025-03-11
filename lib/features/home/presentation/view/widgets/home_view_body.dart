import 'package:bookapp/core/resources/app_routes.dart';
import 'package:bookapp/core/resources/string_manager.dart';
import 'package:bookapp/core/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/resources/assets_manager.dart';
import 'home_list_view_body.dart';
import 'category_body_build.dart';
import 'home_header_build.dart';
import 'carousel_slider_build.dart';
import 'list_view_title_row.dart';

class homeViewBody extends StatelessWidget {
  const homeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var weidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homeHeaderbuild(),
              SizedBox(height: AppSize.s20),
              CarouselSliderBuild(),
              SizedBox(height: AppSize.s16),
              ListViewTitleRow(
                Title: StringsManager.bestSeller,
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kbestSellerView);
                },
              ),
              SizedBox(height: AppSize.s5),
              // -------------------------- ListView of bestseller -------------------------- //
              SizedBox(
                height: heigth * 0.35,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return homeListViewBody(
                      heigth: heigth,
                      weidth: weidth,
                      image: AssetsManager.cross1,
                      bookName: 'The Power of Habit',
                      type: 'Software',
                      sallaryBeforeDiss: '189.00 LE',
                      sallaryAftarDiss: '170.00 LE',
                      diss: '40 %',
                    );
                  },
                  separatorBuilder:
                      (context, index) => SizedBox(width: AppSize.s14),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              // -------------------------- ListView of category -------------------------- //
              ListViewTitleRow(
                Title: StringsManager.category,
                onPressed: () {},
              ),
              SizedBox(height: AppSize.s8),
              SizedBox(
                height: heigth * 0.14,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CategoryBodyBuild();
                  },
                  separatorBuilder:
                      (context, index) => SizedBox(width: AppSize.s14),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              // -------------------------- ListView of NewArrivals -------------------------- //
              ListViewTitleRow(
                Title: StringsManager.newArrivals,
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kNewArrivalsView);
                },
              ),
              SizedBox(height: AppSize.s8),
              SizedBox(
                height: heigth * 0.35,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return homeListViewBody(
                      heigth: heigth,
                      weidth: weidth,
                      image: AssetsManager.cross1,
                      bookName: 'The Power of Habit',
                      type: 'Software',
                      sallaryBeforeDiss: '189.00 LE',
                      sallaryAftarDiss: '170.00 LE',
                      diss: '40 %',
                    );
                  },
                  separatorBuilder:
                      (context, index) => SizedBox(width: AppSize.s14),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
