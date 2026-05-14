import 'package:chat_box/features/friends/data/models/friends.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/hive_manager/hive_manager.dart';
import '../../../../../core/resources/strings/constants.dart';
import 'friends_local_ds.dart';

@Injectable(as: FriendsLocalDs)
class FriendsLocalDsImpl extends FriendsLocalDs{
  HiveManager hiveManager;
  FriendsLocalDsImpl(this.hiveManager);
  @override
  Future<void> updateFriends(Friends value) async {
    hiveManager.put(
        Constants.friendsBox, Constants.friendsKey, value);
  }

  @override
  Future<Friends> getFriends() async {
    Box<Friends> friends =
    await hiveManager.openBox<Friends>(Constants.friendsBox);
    return friends.get(Constants.friendsKey) ?? Friends();
  }

  @override
  void cacheUpdatedTime() {
    DateTime value = DateTime.now();
    hiveManager.put(Constants.updatedTimeFriendsBox, Constants.updatedTimeFriendsKey, value);
  }

  Future<DateTime> getUpdatedTime() async {
    DateTime difference = await hiveManager.get(
        Constants.updatedTimeFriendsBox, Constants.updatedTimeFriendsKey) ??
        DateTime.now();
    return difference;
  }

  @override
  Future<bool> checkExpiryDate() async {
    DateTime currentTime = DateTime.now();
    DateTime updatedTime = await getUpdatedTime();
    if (currentTime.difference(updatedTime).inSeconds > 5) {
      return true;
    }
    return false;
  }
}