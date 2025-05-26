part of 'register_bloc.dart';

enum RegisterStates { initial, loading, success, failed }

class RegisterState {
  RegisterStates? registerStates;
  RegisterResponse? registerResponse;
  AppFailures? failures;

  RegisterState({this.registerStates, this.registerResponse, this.failures});
  RegisterState copyWith({
    RegisterStates? registerStates,
    RegisterResponse? registerResponse,
    AppFailures? failures,
  }) {
    return RegisterState(
      registerStates: registerStates ?? this.registerStates,
      registerResponse: registerResponse ?? this.registerResponse,
      failures: failures ?? this.failures,
    );
  }
}

final class RegisterInitial extends RegisterState {
  RegisterInitial() : super(registerStates: RegisterStates.initial);
}
