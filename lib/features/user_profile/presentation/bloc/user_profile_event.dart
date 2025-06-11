part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileEvent {}

class GetUserProfileEvent extends UserProfileEvent {
  final String id;
  GetUserProfileEvent(this.id);
}

class SendFriendRequestEvent extends UserProfileEvent {
  final String id;
  SendFriendRequestEvent(this.id);
}

class CancelFriendRequestEvent extends UserProfileEvent {
  final String id;
  CancelFriendRequestEvent(this.id);
}
