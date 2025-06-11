import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/search/data/data_source/remote_ds/search_remote_ds.dart';
import 'package:chat_box/features/search/data/models/search_result.dart';
import 'package:chat_box/features/search/domain/repository/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/AppFailures/remote_failures.dart';
import '../../../auth/data/data_source/remote_ds/auth_remote_ds_impl.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl extends SearchRepo{
  SearchRemoteDs searchRemoteDs;
  SearchRepoImpl(this.searchRemoteDs);
  @override
  Future<Either<AppFailures, SearchResult>> search(String keyword) async{
    var result = await searchRemoteDs.search(keyword);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }

}