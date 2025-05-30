import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/friends.dart';

abstract class FriendsRepo {
  Future<Either<AppFailures,Friends>> getFriends();
}
