import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/friends_requests/data/data_source/remote_data_source/friend_request_remote_ds.dart';
import 'package:chat_box/features/friends_requests/data/models/friend_requests.dart';
import 'package:chat_box/features/friends_requests/domain/repository/friend_requests_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/AppFailures/remote_failures.dart';
import '../../../auth/data/data_source/remote_ds/auth_remote_ds_impl.dart';

@Injectable(as: FriendRequestsRepo)
class FriendRequestsRepoImpl extends FriendRequestsRepo {
  FriendRequestRemoteDs friendRequestRemoteDs;
  FriendRequestsRepoImpl(this.friendRequestRemoteDs);

  @override
  Future<Either<AppFailures, FriendRequests>> getFriendRequests() async {
    var result = await friendRequestRemoteDs.getFriendRequests();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }

  @override
  Future<Either<AppFailures, String>> acceptFriendRequest(String id) async{
    var result = await friendRequestRemoteDs.acceptFriendRequest(id);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }

  @override
  Future<Either<AppFailures, String>> declineFriendRequest(String id) async{
    var result = await friendRequestRemoteDs.declineFriendRequest(id);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }
}
