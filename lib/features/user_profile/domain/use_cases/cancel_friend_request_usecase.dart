import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/AppFailures/app_failures.dart';
import '../repository/user_profile_repo.dart';

@injectable
class CancelFriendRequestUseCase {
  UserProfileRepo userProfileRepo;
  CancelFriendRequestUseCase(this.userProfileRepo);

  Future<Either<AppFailures, String>> call(String id) =>
      userProfileRepo.cancelFriendRequest(id);
}
