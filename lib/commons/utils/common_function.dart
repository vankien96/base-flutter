import 'package:base/application/app_config.dart';
import 'package:base/application/dependency_injection.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

String translate(String key) {
  final context = getIt<ApplicationConfig>().getGlobalContext();
  if (context != null) {
    return FlutterI18n.translate(context, key);
  }
  return key;
}

String translatePlural(String key, int number) {
  final context = getIt<ApplicationConfig>().getGlobalContext();
  if (context != null) {
    return FlutterI18n.plural(context, key, number);
  }
  return key;
}
