part of 'search_bloc.dart';

enum SearchRequestState { initial, loading, success, error }

class SearchState {
  SearchRequestState? searchRequestState;
  List<DataList>? users;
  AppFailures? failures;

  SearchState({this.searchRequestState, this.users, this.failures});

  SearchState copyWith({
    SearchRequestState? searchRequestState,
    List<DataList>? users,
    AppFailures? failures,
  }) {
    return SearchState(
      searchRequestState: searchRequestState ?? this.searchRequestState,
      users: users ?? this.users,
      failures: failures ?? this.failures,
    );
  }
}

final class SearchInitial extends SearchState {
  SearchInitial() : super(searchRequestState: SearchRequestState.initial);
}
