part of 'chatted_users_bloc.dart';

abstract class ChattedUsersState extends Equatable {
  const ChattedUsersState();
  @override
  List<Object> get props => [];
}

final class ChattedUsersInitial extends ChattedUsersState {}

class ChattedUsersLoading extends ChattedUsersState {}

class ChattedUsersLoaded extends ChattedUsersState {
  final List<DataList> list;

  const ChattedUsersLoaded(this.list);
  @override
  List<Object> get props => [list];
}

class ChattedUsersError extends ChattedUsersState {
  final AppFailures failures;
  const ChattedUsersError({required this.failures});
  @override
  List<Object> get props => [failures];
}
