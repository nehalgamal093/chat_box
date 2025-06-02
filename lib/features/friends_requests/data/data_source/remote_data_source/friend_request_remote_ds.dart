import '../../models/friend_requests.dart';

abstract class FriendRequestRemoteDs{
  Future<FriendRequests> getFriendRequests();
  Future<String> acceptFriendRequest(String id);
  Future<String> declineFriendRequest(String id);
}