import '../../models/user_profile.dart';

abstract class UserProfileRemoteDs{
  Future<UserProfile> getUserProfile(String id);
  Future<String> sendFriendRequest(String id);
  Future<String> cancelFriendRequest(String id);
}