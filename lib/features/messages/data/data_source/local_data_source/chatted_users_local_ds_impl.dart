import 'package:chat_box/core/network/hive_manager/hive_manager.dart';
import 'package:chat_box/core/resources/strings/constants.dart';
import 'package:chat_box/features/messages/data/data_source/local_data_source/chatted_users_local_ds.dart';
import 'package:chat_box/features/messages/data/models/chatted_users.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChattedUsersLocalDs)
class ChattedUsersLocalDsImpl extends ChattedUsersLocalDs {
  HiveManager hiveManager;
  ChattedUsersLocalDsImpl(this.hiveManager);
  @override
  Future<void> updateUsers(ChattedUsers value) async {
    hiveManager.put(
        Constants.chattedUsersBoxName, Constants.chattedUsersKeyName, value);
  }

  @override
  Future<ChattedUsers> getChattedUsers() async {
    Box<ChattedUsers> chattedUsers =
        await hiveManager.openBox<ChattedUsers>(Constants.chattedUsersBoxName);
    return chattedUsers.get(Constants.chattedUsersKeyName) ?? ChattedUsers();
  }

  @override
  void cacheUpdatedTime() {
    DateTime value = DateTime.now();
    hiveManager.put(Constants.updatedTimeBox, Constants.updatedTimeKey, value);
  }

  Future<DateTime> getUpdatedTime() async {
    DateTime difference = await hiveManager.get(
            Constants.updatedTimeBox, Constants.updatedTimeKey) ??
        DateTime.now();
    return difference;
  }

  @override
  Future<bool> checkExpiryDate() async {
    DateTime currentTime = DateTime.now();
    DateTime updatedTime = await getUpdatedTime();
    if (currentTime.difference(updatedTime).inSeconds > 5) {
      print('📅 checkExpiryDate: true inside');
      return true;
    }
    return false;
  }
}
