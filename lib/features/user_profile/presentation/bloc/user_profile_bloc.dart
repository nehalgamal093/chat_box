import 'package:bloc/bloc.dart';
import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import 'package:chat_box/features/user_profile/domain/use_cases/cancel_friend_request_usecase.dart';
import 'package:chat_box/features/user_profile/domain/use_cases/send_friend_requset_usecase.dart';
import 'package:chat_box/features/user_profile/domain/use_cases/user_profile_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/network/AppFailures/app_failures.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

@injectable
class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileUseCase userProfileUseCase;
  SendFriendRequestUseCase sendFriendRequestUseCase;
  CancelFriendRequestUseCase cancelFriendRequestUseCase;
  UserProfileBloc(
    this.userProfileUseCase,
    this.sendFriendRequestUseCase,
    this.cancelFriendRequestUseCase,
  ) : super(UserProfileInitial()) {
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
          if (model.friendStatus == 'friends') {
            emit(
              state.copyWith(
                profileStates: ProfileStates.success,
                userProfile: model,
                status: 'friends',
              ),
            );
          } else if (model.friendStatus == 'request_sent') {
            emit(
              state.copyWith(
                profileStates: ProfileStates.success,
                userProfile: model,
                status: 'sent',
              ),
            );
          } else {
            emit(
              state.copyWith(
                profileStates: ProfileStates.success,
                userProfile: model,
                status: 'cancel',
              ),
            );
          }
        },
      );
    });

    on<SendFriendRequestEvent>((event, emit) async {

      if (state.profileStates == ProfileStates.success) {
        emit(
          state.copyWith(
            profileStates: ProfileStates.success,
            userProfile: state.userProfile,
            status: "sent",
          ),
        );
        var result = await sendFriendRequestUseCase.call(event.id);
        result.fold((error) {}, (model) {});
      }
    });
    on<CancelFriendRequestEvent>((event, emit) async {

      if (state.profileStates == ProfileStates.success) {
        emit(
          state.copyWith(
            profileStates: ProfileStates.success,
            userProfile: state.userProfile,
            status: "cancel",
          ),
        );
        var result = await cancelFriendRequestUseCase.call(event.id);
        result.fold((error) {}, (model) {});
      }
    });
  }
}
