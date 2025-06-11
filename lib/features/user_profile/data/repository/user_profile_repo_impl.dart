import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/user_profile/data/data_source/remote_data_source/user_profile_remote_ds.dart';
import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import 'package:chat_box/features/user_profile/domain/repository/user_profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/AppFailures/remote_failures.dart';
import '../../../auth/data/data_source/remote_ds/auth_remote_ds_impl.dart';

@Injectable(as: UserProfileRepo)
class UserProfileRepoImpl extends UserProfileRepo {
  UserProfileRemoteDs userProfileRemoteDs;
  UserProfileRepoImpl(this.userProfileRemoteDs);

  @override
  Future<Either<AppFailures, UserProfile>> getFriends(String id) async {
    var result = await userProfileRemoteDs.getUserProfile(id);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }

  @override
  Future<Either<AppFailures, String>> cancelFriendRequest(String id) async{
    var result = await userProfileRemoteDs.sendFriendRequest(id);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }

  @override
  Future<Either<AppFailures, String>> sendFriendRequest(String id) async{
    var result = await userProfileRemoteDs.cancelFriendRequest(id);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }
}
