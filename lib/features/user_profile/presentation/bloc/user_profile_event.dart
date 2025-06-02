part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileEvent {}


class GetUserProfileEvent extends UserProfileEvent {
  final String id;
  GetUserProfileEvent(this.id);
}
