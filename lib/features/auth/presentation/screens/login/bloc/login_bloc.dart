import 'package:bloc/bloc.dart';
import 'package:chat_box/features/auth/data/models/login_response.dart';
import 'package:chat_box/features/auth/domain/use_cases/login_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/AppFailures/app_failures.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;
  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<OnLoginEvent>((event, emit) async{
      emit(state.copyWith(loginStates: LoginStates.loading));

      var result = await loginUseCase.call(event.email, event.password);
      result.fold(
            (error) {
          emit(
            state.copyWith(
              loginStates: LoginStates.failed,
              failures: error,
            ),
          );
        },
            (model) {
          emit(
            state.copyWith(
              loginStates: LoginStates.success,
              loginResponse: model,
            ),
          );
        },
      );
    });

  }
}
