part of 'register_bloc.dart';

abstract class RegisterEvent {}

class OnRegisterEvent extends RegisterEvent {
  RegisterRequest registerRequest;
  OnRegisterEvent(this.registerRequest);
}
