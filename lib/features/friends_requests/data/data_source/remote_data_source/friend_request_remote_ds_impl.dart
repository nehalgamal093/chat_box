import 'package:chat_box/core/network/api_manager/api_manager.dart';
import 'package:chat_box/features/friends_requests/data/data_source/remote_data_source/friend_request_remote_ds.dart';
import 'package:chat_box/features/friends_requests/data/models/friend_requests.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/caching/cache_helper.dart';
import '../../../../../core/resources/strings/endpoints.dart';
import '../../../../auth/data/data_source/remote_ds/auth_remote_ds_impl.dart';

@Injectable(as: FriendRequestRemoteDs)
class FriendRequestRemoteDsImpl extends FriendRequestRemoteDs {
  APIManager apiManager;
  FriendRequestRemoteDsImpl(this.apiManager);
  @override
  Future<FriendRequests> getFriendRequests() async {
    var response = await apiManager.getRequest(
      Endpoints.friendRequests,
      headers: {"token": CacheHelper.getToken()},
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return FriendRequests.fromJson(response.data);
      } else {
        String errorMessage = "Friends Requests Failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['error'] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<String> acceptFriendRequest(String id) async{
    var response = await apiManager.postRequest(
      Endpoints.acceptRequest(id),
      {},
      headers: {"token": CacheHelper.getToken()},
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['message'];
      } else {
        String errorMessage = "Accept Request Failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['error'] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<String> declineFriendRequest(String id) async{
    var response = await apiManager.postRequest(
      Endpoints.declineRequest(id),
      {},
      headers: {"token": CacheHelper.getToken()},
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['message'];
      } else {
        String errorMessage = "Decline Request Failed";
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
