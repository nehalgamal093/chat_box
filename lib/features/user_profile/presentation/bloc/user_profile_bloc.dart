import 'package:bloc/bloc.dart';
import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import 'package:chat_box/features/user_profile/domain/use_cases/user_profile_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/network/AppFailures/app_failures.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

@injectable
class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileUseCase userProfileUseCase;
  UserProfileBloc(this.userProfileUseCase) : super(UserProfileInitial()) {
    on<GetUserProfileEvent>((event, emit) async {
      emit(state.copyWith(profileStates: ProfileStates.loading));

      var result = await userProfileUseCase.call(event.id);
      result.fold(
        (error) {
          emit(
            state.copyWith(
              profileStates: ProfileStates.failed,
              failures: error,
            ),
          );
        },
        (model) {
          emit(
            state.copyWith(
              profileStates: ProfileStates.success,
              userProfile: model,
            ),
          );
        },
      );
    });
  }
}
