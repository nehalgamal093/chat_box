import 'package:bloc/bloc.dart';
import 'package:chat_box/features/friends/domain/usecases/get_friends_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/AppFailures/app_failures.dart';
import '../../data/models/friends.dart';

part 'friends_event.dart';
part 'friends_state.dart';

@injectable
class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  GetFriendsUseCase getFriendsUseCase;
  FriendsBloc(this.getFriendsUseCase) : super(FriendsInitial()) {
    on<LoadItems>((event, emit) async {
      emit(FriendsLoading());

      var result = await getFriendsUseCase.call();
      result.fold(
        (error) {
          emit(FriendsError(failures: error));
        },
        (model) {
          emit(FriendsLoaded(model.dataListList!));
        },
      );
    });
  }
}
