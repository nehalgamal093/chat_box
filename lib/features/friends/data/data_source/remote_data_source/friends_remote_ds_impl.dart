import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:chat_box/core/network/api_manager/api_manager.dart';
import 'package:chat_box/features/friends/data/data_source/friends_local_ds/friends_local_ds.dart';
import 'package:chat_box/features/friends/data/data_source/remote_data_source/friends_remote_ds.dart';
import 'package:chat_box/features/friends/data/models/friends.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/resources/strings/endpoints.dart';
import '../../../../auth/data/data_source/remote_ds/auth_remote_ds_impl.dart';

@Injectable(as: FriendsRemoteDs)
class FriendsRemoteDsImpl extends FriendsRemoteDs {
  APIManager apiManager;
  FriendsLocalDs friendsLocalDs;
  FriendsRemoteDsImpl(this.apiManager,this.friendsLocalDs);

  @override
  Future<Friends> getFriends() async {
    Friends friends = await friendsLocalDs.getFriends();
    final bool isConnected = await InternetConnectionChecker.instance.hasConnection;
    if(!isConnected && friends.dataListList!=null ){
      return friendsLocalDs.getFriends();
    }
    var response = await apiManager.getRequest(
      Endpoints.friends,
      headers: {
        "token":
            CacheHelper.getToken(),
      },
    );
    if(friends.dataListList == null||await friendsLocalDs.checkExpiryDate()){
      friendsLocalDs.cacheUpdatedTime();
      try {
        if (response.statusCode == 200 || response.statusCode == 201) {
          friendsLocalDs.updateFriends(Friends.fromJson(response.data));
          return Friends.fromJson(response.data);
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
    }else{
      return friendsLocalDs.getFriends();
    }
  }
}
