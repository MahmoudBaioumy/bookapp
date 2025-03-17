import 'package:bookapp/core/utils/colors.dart';
import 'package:bookapp/core/utils/string_manager.dart';
import 'package:bookapp/core/utils/value_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_but.dart';
import 'custom_text_form_field.dart';
import 'header_container_build.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          HeaderContainerBuild(),
          SizedBox(height: AppSize.s10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  ///===================================** Name **======================================================================///
                  TextFormFiledProfile(
                    name: 'Mahmoud',
                    icon: Icon(Icons.person, color: ColorsManager.bluecolor),
                  ),
                  SizedBox(height: AppSize.s30),

                  ///===================================** Email **======================================================================///
                  TextFormFiledProfile(
                    name: 'mahoudbaioumy84@gmail.com',
                    type: true,
                    icon: Icon(Icons.email, color: ColorsManager.bluecolor),
                  ),
                  SizedBox(height: AppSize.s30),

                  ///===================================** Phone **======================================================================///
                  TextFormFiledProfile(
                    name: '01032005091',
                    keyboardType: TextInputType.phone,

                    icon: Icon(Icons.phone, color: ColorsManager.bluecolor),
                  ),
                  SizedBox(height: AppSize.s30),

                  ///===================================** City **======================================================================///
                  TextFormFiledProfile(
                    name: 'cairo',
                    icon: Icon(
                      Icons.location_city,
                      color: ColorsManager.bluecolor,
                    ),
                  ),
                  SizedBox(height: AppSize.s30),
                  CustomButton(
                    text: StringsManager.updateProfileButton,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
