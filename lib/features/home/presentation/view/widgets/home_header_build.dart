import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';
import 'package:bookapp/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors.dart';

import '../../../../../core/utils/serves_locator.dart';
import '../../../../../core/utils/storage/cache_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../profile/data/repo/profile_repo_impl.dart';
import '../../../../profile/presentation/manager/cubit/profile_states.dart';

class homeHeaderbuild extends StatefulWidget {
  const homeHeaderbuild({super.key});

  @override
  State<homeHeaderbuild> createState() => _homeHeaderbuildState();
}

class _homeHeaderbuildState extends State<homeHeaderbuild> {
  @override
  String? token = CacheHelper.getData(key: 'token');
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getit.get<ProfileRepoImpl>())..getProfile(token: token??''),
      child: Row(
        children: [
          SizedBox(width: AppSize.s16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ProfileCubit, ProfileStates>(
                builder: (context, state) {
                  if(state is profileSuccessStates) {
                    var name = state.showProfileModel.data?.name;
                    print('Name: $name');
                    return Text(
                      '${AppStringsLanguage.titel.trans()} $name',
                      style: textStyle22(
                        color: ColorsManager.blackcolor,
                        fontsize: AppSize.s26,
                      ),
                    );
                  }else{
                    return Text(
                      AppStringsLanguage.titel.trans(),
                      style: textStyle22(
                        color: ColorsManager.blackcolor,
                        fontsize: AppSize.s26,
                      ),
                    );
                  }
                },
              ),
              Text(
                AppStringsLanguage.homeheader.trans(),
                style: textStyle19(
                  color: ColorsManager.greycolor,
                  fontsize: AppSize.s16,
                ),
              ),
            ],
          ),
          Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                maxRadius: AppSize.s24,
                foregroundColor: ColorsManager.blackcolor,
              ),
              CircleAvatar(
                maxRadius: AppSize.s22,
                backgroundImage: AssetImage(AssetsManager.User),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
