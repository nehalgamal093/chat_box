import 'package:bloc/bloc.dart';
import 'package:chat_box/features/messages/domain/use_cases/chatted_users_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/network/AppFailures/app_failures.dart';
import '../../data/models/chatted_users.dart';

part 'chatted_users_event.dart';
part 'chatted_users_state.dart';

@injectable
class ChattedUsersBloc extends Bloc<ChattedUsersEvent, ChattedUsersState> {
  ChattedUsersUseCase chattedUsersUseCase;
  ChattedUsersBloc(this.chattedUsersUseCase) : super(ChattedUsersInitial()) {
    on<LoadChattedUsers>((event, emit) async {
      emit(ChattedUsersLoading());

      var result = await chattedUsersUseCase.call();
      result.fold(
        (error) {
          emit(ChattedUsersError(failures: error));
        },
        (model) {
          emit(ChattedUsersLoaded(model.dataListList!));
        },
      );
    });
  }
}
