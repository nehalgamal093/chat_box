import 'package:chat_box/features/user_profile/data/models/change_photo_response.dart';
import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/AppFailures/app_failures.dart';

abstract class UserProfileRepo{
  Future<Either<AppFailures,UserProfile>> getFriends(String id);
  Future<Either<AppFailures,String>> sendFriendRequest(String id);
  Future<Either<AppFailures,String>> cancelFriendRequest(String id);
  Future<Either<AppFailures,ChangePhotoResponse>> changePhoto(String file);
}