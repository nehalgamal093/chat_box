import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chatted_users_event.dart';
part 'chatted_users_state.dart';

class ChattedUsersBloc extends Bloc<ChattedUsersEvent, ChattedUsersState> {
  ChattedUsersBloc() : super(ChattedUsersInitial()) {
    on<ChattedUsersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
