import 'package:flutter/material.dart';

class ApplicationConfig {
  ApplicationConfig();

  final navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? getGlobalContext() {
    return navigatorKey.currentContext;
  }
}
