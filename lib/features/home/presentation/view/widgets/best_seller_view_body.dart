import 'package:bookapp/core/resources/string_manager.dart';
import 'package:bookapp/core/resources/value_manager.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'custom_container_best_seller_list_view.dart';

class BestSellerViewBody extends StatelessWidget {
  const BestSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var weidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: StringsManager.bestSeller,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(AppPadding.p16),
        child: Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return CustomContainerBestSellerListView(heigth: heigth, weidth: weidth);
            },
            separatorBuilder: (context, index) => SizedBox(height: AppSize.s10),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
