import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/friends/data/data_source/remote_data_source/friends_remote_ds.dart';
import 'package:chat_box/features/friends/data/models/friends.dart';
import 'package:chat_box/features/friends/domain/repository/friends_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/AppFailures/remote_failures.dart';
import '../../../auth/data/data_source/remote_ds/auth_remote_ds_impl.dart';

@Injectable(as: FriendsRepo)
class FriendsRepoImpl extends FriendsRepo {
  FriendsRemoteDs friendsRemoteDs;
  FriendsRepoImpl(this.friendsRemoteDs);
  @override
  Future<Either<AppFailures, Friends>> getFriends() async {
    var result = await friendsRemoteDs.getFriends();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }
}
