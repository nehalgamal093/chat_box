part of 'friend_requests_bloc.dart';

abstract class FriendRequestsEvent extends Equatable {
  const FriendRequestsEvent();
  @override
  List<Object> get props => [];
}

class LoadFriendRequests extends FriendRequestsEvent {}

class AcceptRequestEvent extends FriendRequestsEvent {
  final String id;
  const AcceptRequestEvent(this.id);
}

class DeclineRequestEvent extends FriendRequestsEvent {
  final String id;
  const DeclineRequestEvent(this.id);
}