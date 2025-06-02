import 'package:chat_box/core/network/api_manager/api_manager.dart';
import 'package:chat_box/features/messages/data/data_source/remote_data_source/chatted_users_remote_ds.dart';
import 'package:chat_box/features/messages/data/models/chatted_users.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/caching/cache_helper.dart';
import '../../../../../core/resources/strings/endpoints.dart';
import '../../../../auth/data/data_source/remote_ds/auth_remote_ds_impl.dart';

@Injectable(as: ChattedUsersRemoteDs)
class ChattedUsersRemoteDsImpl extends ChattedUsersRemoteDs {
  APIManager apiManager;
  ChattedUsersRemoteDsImpl(this.apiManager);
  @override
  Future<ChattedUsers> getChattedUsers() async {
    var response = await apiManager.getRequest(
      Endpoints.chattedUsers,
      headers: {"token": CacheHelper.getToken()},
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ChattedUsers.fromJson(response.data);
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
