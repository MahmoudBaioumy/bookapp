import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

Logger logger = Logger(
  level: kDebugMode ? Level.debug : Level.nothing,
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 5,
    lineLength: 100,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);