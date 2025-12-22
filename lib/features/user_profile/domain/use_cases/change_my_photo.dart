import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/user_profile/data/models/change_photo_response.dart';
import 'package:chat_box/features/user_profile/domain/repository/user_profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangeMyPhoto {
  UserProfileRepo userProfileRepo;
  ChangeMyPhoto(this.userProfileRepo);
  Future<Either<AppFailures, ChangePhotoResponse>> call(String file) =>
      userProfileRepo.changePhoto(file);
}
