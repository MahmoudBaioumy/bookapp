import 'package:bookapp/features/home/presentation/view/widgets/custom_container_new_arrivals_list_vew.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/string_manager.dart';
import '../../../../../core/resources/value_manager.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class NewArrivalsViewBody extends StatelessWidget {
  const NewArrivalsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var weidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: StringsManager.newArrivals,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p16),
        child: Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return CustomContainerNewArrivalsListVew(
                heigth: heigth,
                weidth: weidth,
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: AppSize.s10),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
