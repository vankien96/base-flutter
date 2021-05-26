import 'package:flutter/material.dart';

class Setting {
  final String appName = 'base';
  ValueNotifier<Locale> language = new ValueNotifier(Locale('en', ''));
  ValueNotifier<Brightness> brightnessMode =
      new ValueNotifier(Brightness.light);

  Setting();
}
