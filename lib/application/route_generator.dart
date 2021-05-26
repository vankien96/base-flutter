import 'package:base/application/dependency_injection.dart';
import 'package:base/presentation/pages/home/home.dart';
import 'package:base/presentation/pages/home/home_bloc.dart';
import 'package:base/presentation/pages/login/login.dart';
import 'package:base/presentation/pages/login/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteType {
  static const String home = '/home';
  static const String login = '/login';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteType.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => getIt<HomeBloc>(), child: HomePage()));
      case RouteType.login:
        return CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (_) => BlocProvider(
                create: (_) => getIt<LoginBloc>(), child: LoginPage()));
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
