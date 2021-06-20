import 'package:base/application/dependency_injection.dart';
import 'package:base/application/route_generator.dart';
import 'package:base/commons/const/strings.dart';
import 'package:base/commons/utils/common_function.dart';
import 'package:base/domain/models/manager/setting_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getIt<SettingManager>().setting.value.appName),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(translate(Strings.home.hello)),
            TextButton(
                child: Text(translate(Strings.home.changeLanguage)),
                onPressed: () async {
                  getIt<SettingManager>().changeLanguage(context);
                }),
            TextButton(
                child: Text(translate(Strings.login.title)),
                onPressed: () async {
                  Navigator.of(context).pushNamed(RouteType.login);
                })
          ],
        ),
      ),
    );
  }
}
