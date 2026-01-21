part of 'chatted_users_bloc.dart';

abstract class ChattedUsersEvent extends Equatable {
  const ChattedUsersEvent();
  @override
  List<Object> get props => [];
}

class LoadChattedUsers extends ChattedUsersEvent {}
class UpdateOnlineUsers extends ChattedUsersEvent{
  final List<dynamic> onlineUsers;

  const UpdateOnlineUsers(this.onlineUsers);
  @override
  List<Object> get props => [onlineUsers];
}