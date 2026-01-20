import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_box/features/messages/domain/use_cases/chatted_users_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/di/di.dart';
import '../../../../core/network/AppFailures/app_failures.dart';
import '../../../../core/resources/socket/socket_service.dart';
import '../../data/models/chatted_users.dart';

part 'chatted_users_event.dart';
part 'chatted_users_state.dart';

@injectable
class ChattedUsersBloc extends Bloc<ChattedUsersEvent, ChattedUsersState> {
  ChattedUsersUseCase chattedUsersUseCase;
  StreamSubscription? _onlineSubscription;
  List<dynamic> onlineIds = [];
  final socketService = getIt<SocketService>();
  ChattedUsersBloc(this.chattedUsersUseCase) : super(ChattedUsersInitial()) {
    _onlineSubscription = socketService.onlineList.listen((onlineList){
      onlineIds.clear();
      onlineIds.addAll(onlineList);
      add(UpdateOnlineUsers(onlineIds));
    });
    on<LoadChattedUsers>((event, emit) async {
      emit(ChattedUsersLoading());
      var result = await chattedUsersUseCase.call();

        result.fold(
              (error) {
            emit(ChattedUsersError(failures: error));
          },
              (model) {
            print("Yes");
            emit(ChattedUsersLoaded(model.dataListList!));
          },
        );

    });
    on<UpdateOnlineUsers>(_onUpdateOnlineUsers);
  }
  void _onUpdateOnlineUsers(UpdateOnlineUsers event, Emitter emit) {
    onlineIds.clear();
    onlineIds.addAll(event.onlineUsers);
    if (state is ChattedUsersLoaded) {
      final current = state as ChattedUsersLoaded;
      final updatedList = current.list.map((item) {
        if (item.user != null) {
          // Create new DataList with updated user
          return item.user?.copyWith(
              isOnline: onlineIds.contains(item.user!.id));
        }
        return item;
      }).toList();
      emit(ChattedUsersLoaded(current.list));
    }
  }

}
