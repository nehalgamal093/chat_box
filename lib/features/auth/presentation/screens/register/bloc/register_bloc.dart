import 'package:bloc/bloc.dart';
import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/auth/data/models/register_request.dart';
import 'package:chat_box/features/auth/data/models/register_response.dart';
import 'package:chat_box/features/auth/domain/use_cases/register_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterUseCase registerUseCase;
  RegisterBloc(this.registerUseCase) : super(RegisterInitial()) {
    on<OnRegisterEvent>((event, emit) async {
      emit(state.copyWith(registerStates: RegisterStates.loading));

      var result = await registerUseCase.call(request: event.registerRequest);
      result.fold(
        (error) {
          emit(
            state.copyWith(
              registerStates: RegisterStates.failed,
              failures: error,
            ),
          );
        },
        (model) {
          emit(
            state.copyWith(
              registerStates: RegisterStates.success,
              registerResponse: model,
            ),
          );
        },
      );
    });
  }
}
