import 'package:base/application/dependency_injection.dart';
import 'package:base/commons/const/strings.dart';
import 'package:base/commons/utils/common_function.dart';
import 'package:base/domain/models/manager/setting_manager.dart';
import 'package:base/presentation/pages/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getIt<SettingManager>().setting.value.appName),
          automaticallyImplyLeading: false,
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginStateFinish) {
            Navigator.of(context).pop();
          }
        },
        child: Center(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _usernameTextField(),
                  SizedBox(
                    height: 16,
                  ),
                  _passwordTextField(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildLoginButton()
                ],
              )),
        ));
  }

  Widget _usernameTextField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        decoration:
            new InputDecoration(labelText: translate(Strings.login.username)),
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => context.read<LoginBloc>().username = value,
      );
    });
  }

  Widget _passwordTextField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        decoration:
            new InputDecoration(labelText: translate(Strings.login.password)),
        obscureText: true,
        onChanged: (value) => context.read<LoginBloc>().password = value,
      );
    });
  }

  Widget _buildLoginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginStateLoading) {
        return TextButton(onPressed: () {}, child: CircularProgressIndicator());
      } else {
        return TextButton(
            onPressed: () {
              context.read<LoginBloc>().login();
            },
            child: Text(translate(Strings.login.title)));
      }
    });
  }
}
