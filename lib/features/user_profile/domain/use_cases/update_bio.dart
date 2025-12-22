import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/user_profile/domain/repository/user_profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateBio {
  UserProfileRepo userProfileRepo;
  UpdateBio(this.userProfileRepo);
  Future<Either<AppFailures, String>> call(String bio) =>
      userProfileRepo.updateBio(bio);
}
