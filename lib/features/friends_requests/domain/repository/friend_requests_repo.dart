import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/friends_requests/data/models/friend_requests.dart';
import 'package:dartz/dartz.dart';

abstract class FriendRequestsRepo{
  Future<Either<AppFailures,FriendRequests>> getFriendRequests();
  Future<Either<AppFailures,String>> acceptFriendRequest(String id);
  Future<Either<AppFailures,String>> declineFriendRequest(String id);
}