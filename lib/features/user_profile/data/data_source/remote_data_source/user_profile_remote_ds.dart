import '../../models/user_profile.dart';

abstract class UserProfileRemoteDs{
  Future<UserProfile> getUserProfile(String id);
}