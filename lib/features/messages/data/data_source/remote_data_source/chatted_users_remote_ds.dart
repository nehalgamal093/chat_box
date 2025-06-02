import '../../models/chatted_users.dart';

abstract class ChattedUsersRemoteDs{
  Future<ChattedUsers> getChattedUsers();
}