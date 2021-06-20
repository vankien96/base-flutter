import 'package:base/commons/const/hive_key.dart';
import 'package:base/commons/enums/language.dart';
import 'package:base/data/local/app_local_store.dart';
import 'package:base/domain/models/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class SettingManager {
  AppLocalStore localStore;

  SettingManager(this.localStore);

  ValueNotifier<Setting> setting = new ValueNotifier(new Setting());

  void setSetting(Setting setting) {
    this.setting.value = setting;
    this.setting.notifyListeners();
  }

  Future<Setting> getCurrentSetting() async {
    var setting = Setting();
    setting.brightnessMode.value = await getBrightness();
    setting.language.value = Locale(await getCurrentLanguage());
    return setting;
  }

  Future<Brightness> getBrightness() async {
    var settingBox = localStore.settingBox;
    var isDark = settingBox.get(HiveKey.isDark);
    return (isDark ?? false) ? Brightness.dark : Brightness.light;
  }

  Future<void> setBrightness(Brightness brightness) async {
    var settingBox = localStore.settingBox;
    setting.value.brightnessMode.value = brightness;
    settingBox.put(HiveKey.isDark, brightness == Brightness.dark);
  }

  Future<void> setLanguage(SupportedLanguage language) async {
    var settingBox = localStore.settingBox;
    setting.value.language.value = language.toLocale();
    settingBox.put(HiveKey.language, language.toLanguageCode());
    setting.notifyListeners();
  }

  Future<String> getCurrentLanguage() async {
    var settingBox = localStore.settingBox;
    var language = settingBox.get(HiveKey.language);
    return language ?? "en";
  }

  //Just for test
  void changeLanguage(BuildContext context) async {
    setLanguage(setting.value.language.value == Locale("en")
        ? SupportedLanguage.vi
        : SupportedLanguage.en);
    await FlutterI18n.refresh(context, setting.value.language.value);
  }
}
