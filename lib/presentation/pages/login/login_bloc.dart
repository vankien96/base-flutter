import 'package:base/domain/usecases/authentication_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc(LoginState initialState, AuthUsecase authUsecase)
      : this.authUsecase = authUsecase,
        super(initialState);

  AuthUsecase authUsecase;

  var username = "";
  var password = "";

  void login() async {
    emit(LoginStateLoading());
    await authUsecase.loginWithCredential(username, password);
    emit(LoginStateFinish());
  }
}
