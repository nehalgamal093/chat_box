import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import 'package:chat_box/features/user_profile/domain/repository/user_profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/AppFailures/app_failures.dart';

@injectable
class UserProfileUseCase {
  UserProfileRepo userProfileRepo;
  UserProfileUseCase(this.userProfileRepo);
  Future<Either<AppFailures, UserProfile>> call(String id) =>
      userProfileRepo.getFriends(id);
}
