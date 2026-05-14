import '../../models/chatted_users.dart';

abstract class ChattedUsersLocalDs {
  Future<ChattedUsers> getChattedUsers();
  void updateUsers(ChattedUsers value);
  void cacheUpdatedTime();
  Future<bool> checkExpiryDate();
}