part of 'login_bloc.dart';


 abstract class LoginEvent {}

class OnLoginEvent extends LoginEvent {
  final String email;
  final String password;
  OnLoginEvent(this.email,this.password);
}
