import 'package:chat_box/features/friends/data/models/friends.dart';

abstract class FriendsLocalDs {
  Future<Friends> getFriends();
  void updateFriends(Friends value);
  void cacheUpdatedTime();
  Future<bool> checkExpiryDate();
}