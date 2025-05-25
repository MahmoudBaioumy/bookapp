import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/app_routes.dart';
import 'package:bookapp/core/utils/assets_manager.dart';
import 'package:bookapp/core/utils/colors.dart';
import 'package:bookapp/core/utils/value_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/lang/string_language_manager.dart';
import '../../../../../core/utils/storage/cache_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'card_lang_build.dart';

class LangView extends StatefulWidget {
  const LangView({super.key});

  @override
  State<LangView> createState() => _LangViewState();
}

class _LangViewState extends State<LangView> {

  void serviceNullWhenChangedLanguage() {
    GoRouter.of(context).push(AppRouter.kbottomnavView);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height * 0.024;
    var width = MediaQuery
        .of(context)
        .size
        .width * 0.024;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: AppStringsLanguage.language.trans(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: AppSize.s70,
          left: AppSize.s8,
          right: AppSize.s8,
          bottom: AppSize.s8,),
        child: Column(
          children: [
            Center(child: Image.asset(
              AssetsManager.logo, color: ColorsManager.bluecolor,)),
            SizedBox(height: AppSize.s70,),
            buildLanguageWidget(
              colorContainer: CacheHelper.getData(key: 'languageApp') == "ar"
                  ? ColorsManager.bluecolor
                  : ColorsManager.white1color,
              colorText: CacheHelper.getData(key: 'languageApp') == "ar"
                  ? ColorsManager.white1color
                  : ColorsManager.blackcolor,
              height: height,
              width: width,
              title: AppStringsLanguage.arabic.trans(),
              onTap: () {
                CacheHelper.saveData(key: 'languageApp', value: "ar");
                context.setLocale(const Locale("ar"));
                GoRouter.of(context).push(AppRouter.kbottomnavView);
                setState(() {});
              },
            ),
            SizedBox(height: AppSize.s16,),
            buildLanguageWidget(
              colorContainer: CacheHelper.getData(key: 'languageApp') == "en"
                  ? ColorsManager.bluecolor
                  : ColorsManager.white1color,
              colorText: CacheHelper.getData(key: 'languageApp') == "en"
                  ? ColorsManager.white1color
                  : ColorsManager.blackcolor,
              height: height,
              width: width,
              title: AppStringsLanguage.english.trans(),
              onTap: () {
                CacheHelper.saveData(key: 'languageApp', value: "en");
                context.setLocale(const Locale("en"));
                GoRouter.of(context).push(AppRouter.kbottomnavView);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
