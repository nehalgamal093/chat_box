import 'package:bloc/bloc.dart';
import 'package:chat_box/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'logout_event.dart';
part 'logout_state.dart';

@injectable
class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutUseCase logoutUseCase;
  LogoutBloc(this.logoutUseCase) : super(LogoutInitial()) {
    on<LoggingOutEvent>((event, emit) async {
      emit(LogoutLoading());

      var result = await logoutUseCase.call();
      result.fold(
        (error) {
          emit(LogoutFailed());
        },
        (model) {
          emit(LogoutSuccess());
        },
      );
    });
  }
}
