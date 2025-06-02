import 'package:bloc/bloc.dart';
import 'package:chat_box/features/friends_requests/domain/use_cases/friend_requests_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/AppFailures/app_failures.dart';
import '../../../data/models/friend_requests.dart';

part 'friend_requests_event.dart';
part 'friend_requests_state.dart';

@injectable
class FriendRequestsBloc
    extends Bloc<FriendRequestsEvent, FriendRequestsState> {
  FriendRequestUseCase friendRequestUseCase;
  FriendRequestsBloc(this.friendRequestUseCase)
    : super(FriendRequestsInitial()) {
    on<LoadFriendRequests>(_loadFriendRequests);
    on<AcceptRequestEvent>(_acceptRequest);
    on<DeclineRequestEvent>(_declineRequest);
  }
  void _loadFriendRequests(
    LoadFriendRequests event,
    Emitter<FriendRequestsState> emit,
  ) async {
    emit(FriendRequestsLoading());

    var result = await friendRequestUseCase.call();
    result.fold(
      (error) {
        emit(FriendRequestsError(failures: error));
      },
      (model) {
        emit(FriendRequestsLoaded(model.dataListList!, "normal"));
      },
    );
  }

  void _acceptRequest(
    AcceptRequestEvent event,
    Emitter<FriendRequestsState> emit,
  ) async {
    if (state is FriendRequestsLoaded) {
      var list = (state as FriendRequestsLoaded).list;
      List<DataList> friendRequests = List.of(list);
      emit(FriendRequestsLoaded(friendRequests, "accepted"));
    }
    var result = await friendRequestUseCase.accept(event.id);
    result.fold((error) {}, (model) {});
  }

  void _declineRequest(
    DeclineRequestEvent event,
    Emitter<FriendRequestsState> emit,
  ) async {
    if (state is FriendRequestsLoaded) {
      var list = (state as FriendRequestsLoaded).list;
      int index = list.indexWhere((e) => e.id == event.id);
      List<DataList> friendRequests = List.of(list)..removeAt(index);
      emit(FriendRequestsLoaded(friendRequests, "declined"));
    }
    var result = await friendRequestUseCase.decline(event.id);
    result.fold((error) {}, (model) {});
  }
}
