part of 'friends_bloc.dart';

abstract class FriendsState extends Equatable {
  const FriendsState();
  @override
  List<Object> get props => [];
}

final class FriendsInitial extends FriendsState {}

class FriendsLoading extends FriendsState {}

class FriendsLoaded extends FriendsState {
  final List<DataList> list;

  const FriendsLoaded(this.list);
  @override
  List<Object> get props => [list];
}

class FriendsError extends FriendsState {
  final AppFailures failures;
  const FriendsError({required this.failures});
  @override
  List<Object> get props => [failures];
}
