import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/messages/data/data_source/remote_data_source/chatted_users_remote_ds.dart';
import 'package:chat_box/features/messages/data/models/chatted_users.dart';
import 'package:chat_box/features/messages/domain/repository/chatted_users_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/AppFailures/remote_failures.dart';
import '../../../auth/data/data_source/remote_ds/auth_remote_ds_impl.dart';

@Injectable(as: ChattedUsersRepo)
class ChattedUsersRepoImpl extends ChattedUsersRepo {
  ChattedUsersRemoteDs chattedUsersRemoteDs;
  ChattedUsersRepoImpl(this.chattedUsersRemoteDs);
  @override
  Future<Either<AppFailures, ChattedUsers>> getChattedUsers() async {
    var result = await chattedUsersRemoteDs.getChattedUsers();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }
}
