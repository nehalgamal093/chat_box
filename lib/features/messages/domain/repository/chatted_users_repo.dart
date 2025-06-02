import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/messages/data/models/chatted_users.dart';
import 'package:dartz/dartz.dart';


abstract class ChattedUsersRepo {
  Future<Either<AppFailures,ChattedUsers>> getChattedUsers();
}
