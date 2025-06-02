part of 'chatted_users_bloc.dart';

abstract class ChattedUsersEvent extends Equatable {
  const ChattedUsersEvent();
  @override
  List<Object> get props => [];
}

class LoadChattedUsers extends ChattedUsersEvent {}
