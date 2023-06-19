import 'package:base/application/app_config.dart';
import 'package:base/application/route_generator.dart';
import 'package:base/commons/utils/connectivity_util.dart';
import 'package:base/core/api/api_config.dart';
import 'package:base/domain/models/manager/setting_manager.dart';
import 'package:base/domain/models/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:base/data/local/app_local_store.dart';

import './application/dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  await initHive();
  await initSetting();
  await setupEnvironment();
  await di.getIt<ConnectivityUtil>().listen();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: di.getIt<SettingManager>().setting,
        builder: (context, Setting _setting, _) {
          return MaterialApp(
            navigatorKey: di.getIt<ApplicationConfig>().navigatorKey,
            title: _setting.appName,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            localizationsDelegates: [
              FlutterI18nDelegate(
                  translationLoader: FileTranslationLoader(
                      basePath: "assets/i18n",
                      useCountryCode: false,
                      fallbackFile: "en",
                      forcedLocale: _setting.language.value),
                  missingTranslationHandler: (key, locale) {
                    print(
                        "--- Missing localize key: $key in language: $locale");
                  }),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            initialRoute: RouteType.home,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        });
  }
}

Future<void> initHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await di.getIt<AppLocalStore>().init();
}

Future<void> initSetting() async {
  var setting = await di.getIt<SettingManager>().getCurrentSetting();
  di.getIt<SettingManager>().setSetting(setting);
}

Future<void> setupEnvironment() async {
  await GlobalConfiguration().loadFromAsset("configuration.json");

  final baseURL = GlobalConfiguration().get("base_url");
  final version = GlobalConfiguration().get("version");
  final clientID = GlobalConfiguration().get("client_id");
  final clientSecret = GlobalConfiguration().get("client_secret");

  APIConfig.setup(baseURL, version, clientID, clientSecret);
}
