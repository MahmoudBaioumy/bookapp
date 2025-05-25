import 'dart:ui';
import 'ar.dart';
import 'en.dart';
import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": enJson, // todo en
    "ar": arJson,
  };
}


