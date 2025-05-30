import 'package:chat_box/features/friends/data/models/friends.dart';

abstract class FriendsRemoteDs {
  Future<Friends> getFriends();
}
