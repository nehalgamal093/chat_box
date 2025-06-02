part of 'friend_requests_bloc.dart';

abstract class FriendRequestsState extends Equatable {
  const FriendRequestsState();
  @override
  List<Object> get props => [];
}

final class FriendRequestsInitial extends FriendRequestsState {}

class FriendRequestsLoading extends FriendRequestsState {}

class FriendRequestsLoaded extends FriendRequestsState {
  final List<DataList> list;
  final String status;
  const FriendRequestsLoaded(this.list,this.status);
  @override
  List<Object> get props => [list,status];
}

class FriendRequestsError extends FriendRequestsState {
  final AppFailures failures;
  const FriendRequestsError({required this.failures});
  @override
  List<Object> get props => [failures];
}
