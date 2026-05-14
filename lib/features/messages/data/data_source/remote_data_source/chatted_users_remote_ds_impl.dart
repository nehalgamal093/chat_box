import 'package:chat_box/core/network/api_manager/api_manager.dart';
import 'package:chat_box/features/messages/data/data_source/local_data_source/chatted_users_local_ds.dart';
import 'package:chat_box/features/messages/data/data_source/remote_data_source/chatted_users_remote_ds.dart';
import 'package:chat_box/features/messages/data/models/chatted_users.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart' as ConnectivityResult;
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/caching/cache_helper.dart';
import '../../../../../core/resources/strings/endpoints.dart';
import '../../../../auth/data/data_source/remote_ds/auth_remote_ds_impl.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@Injectable(as: ChattedUsersRemoteDs)
class ChattedUsersRemoteDsImpl extends ChattedUsersRemoteDs {
  ChattedUsersLocalDs chattedUsersLocalDs;
  APIManager apiManager;
  ChattedUsersRemoteDsImpl(this.apiManager, this.chattedUsersLocalDs);
  @override
  Future<ChattedUsers> getChattedUsers() async {
    ChattedUsers users = await chattedUsersLocalDs.getChattedUsers();
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      print("HIIIIIIIIIIIIIIIIIIIIIIIII");
      return chattedUsersLocalDs.getChattedUsers();
    }
    var response = await apiManager.getRequest(
      Endpoints.chattedUsers,
      headers: {"token": CacheHelper.getToken()},
    );
    print('=========================');
    bool isExpired = await chattedUsersLocalDs.checkExpiryDate();
    print('📅 isExpired: $isExpired');

    if (users.dataListList == null || isExpired) {
      chattedUsersLocalDs.cacheUpdatedTime();
      try {
        if (response.statusCode == 200 || response.statusCode == 201) {
          chattedUsersLocalDs.updateUsers(ChattedUsers.fromJson(response.data));
          chattedUsersLocalDs.cacheUpdatedTime();
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
    } else {
      return chattedUsersLocalDs.getChattedUsers();
    }
  }
}
