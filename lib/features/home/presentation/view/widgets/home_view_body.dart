import 'package:bookapp/core/utils/serves_locator.dart';
import 'package:bookapp/core/utils/string_manager.dart';
import 'package:bookapp/core/utils/value_manager.dart';
import 'package:bookapp/core/widgets/custom_error_widget.dart';
import 'package:bookapp/features/home/data/models/new_arrivalls_model.dart/new_arrivals_model/new_arrivals_model.dart';
import 'package:bookapp/features/home/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookapp/features/home/presentation/manager/best_seller_cubit/best_seller_state.dart';
import 'package:bookapp/features/home/presentation/manager/new_arrivels_cubit/new_arrvals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../data/repo/home_repo_impl.dart';
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
        padding: EdgeInsets.symmetric(
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
              BlocBuilder<BestSellerCubit, BestSellerState>(
                builder: (context, state) {
                  if (state is BestSellerSuccessState) {
                    return SizedBox(
                      height: heigth * 0.35,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return homeListViewBody(
                            heigth: heigth,
                            weidth: weidth,
                            image:
                                state.books[index].data?.products?[index].image??'',
                            bookName:
                                state.books[index].data?.products?[index].name??'',
                            type:
                                state
                                    .books[index]
                                    .data
                                    ?.products?[index]
                                    .category??'',
                            sallaryBeforeDiss:
                                state.books[index].data?.products?[index].price??'',
                            sallaryAftarDiss:
                                state
                                    .books[index]
                                    .data
                                    ?.products?[index]
                                    .priceAfterDiscount
                                    .toString()??'',
                            diss:
                                state
                                    .books[index]
                                    .data
                                    ?.products?[index]
                                    .discount
                                    .toString()??'',
                          );
                        },
                        separatorBuilder:
                            (context, index) => SizedBox(width: AppSize.s14),
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  } else if (state is BestSellerFailureState) {
                    return CustomErrorWidget(errMassage: state.errMassage);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
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
                child: BlocBuilder<NewArrvalsCubit, NewArrivalsState>(
                  builder: (context, state) {
                    if (state is NewArrivalsSuccess) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return homeListViewBody(
                            heigth: heigth,
                            weidth: weidth,
                            image:
                                state
                                    .NewArrivalsbooks[index]
                                    .data
                                    ?.products?[index]
                                    .image,
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
                      );
                    } else if (state is NewArrivalsFailure) {
                      return Center(
                        child: CustomErrorWidget(errMassage: state.errMessage),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
