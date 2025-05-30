part of 'login_bloc.dart';

enum LoginStates { initial, loading, success, failed }

class LoginState {
  LoginStates? loginStates;
  LoginResponse? loginResponse;
  AppFailures? failures;

  LoginState({this.loginStates, this.loginResponse, this.failures});
  LoginState copyWith({
    LoginStates? loginStates,
    LoginResponse? loginResponse,
    AppFailures? failures,
  }) {
    return LoginState(
      loginStates: loginStates ?? this.loginStates,
      loginResponse: loginResponse ?? this.loginResponse,
      failures: failures ?? this.failures,
    );
  }
}

final class LoginInitial extends LoginState {
  LoginInitial() : super(loginStates: LoginStates.initial);
}
