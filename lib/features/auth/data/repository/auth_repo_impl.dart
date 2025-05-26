import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/core/network/AppFailures/remote_failures.dart';
import 'package:chat_box/features/auth/data/data_source/remote_ds/AuthRemoteDsImpl.dart';
import 'package:chat_box/features/auth/data/data_source/remote_ds/auth_remote_ds.dart';
import 'package:chat_box/features/auth/data/models/register_request.dart';
import 'package:chat_box/features/auth/data/models/register_response.dart';
import 'package:chat_box/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthRemoteDs authRemoteDs;
  AuthRepoImpl(this.authRemoteDs);

  @override
  Future<Either<AppFailures, RegisterResponse>> register({
    RegisterRequest? request,
  }) async {
    var result = await authRemoteDs.register(request: request);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }
}
