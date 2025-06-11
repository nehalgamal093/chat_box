import 'package:chat_box/core/network/api_manager/api_manager.dart';
import 'package:chat_box/features/search/data/data_source/remote_ds/search_remote_ds.dart';
import 'package:chat_box/features/search/data/models/search_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/caching/cache_helper.dart';
import '../../../../../core/resources/strings/endpoints.dart';
import '../../../../auth/data/data_source/remote_ds/auth_remote_ds_impl.dart';

@Injectable(as: SearchRemoteDs)
class SearchRemoteDsImpl extends SearchRemoteDs {
  APIManager apiManager;

  SearchRemoteDsImpl(this.apiManager);

  @override
  Future<SearchResult> search(String keyword) async {
    var response = await apiManager.getRequest(
      Endpoints.search(keyword),
      headers: {"token": CacheHelper.getToken()},
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return SearchResult.fromJson(response.data);
      } else {
        String errorMessage = "Friends Failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['error'] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }
}
