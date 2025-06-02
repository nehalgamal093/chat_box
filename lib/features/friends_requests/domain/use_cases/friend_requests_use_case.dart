
import 'package:chat_box/features/friends_requests/data/models/friend_requests.dart';
import 'package:chat_box/features/friends_requests/domain/repository/friend_requests_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/AppFailures/app_failures.dart';

@injectable
class FriendRequestUseCase{
  FriendRequestsRepo friendRequestsRepo;
  FriendRequestUseCase(this.friendRequestsRepo);
  Future<Either<AppFailures, FriendRequests>> call() =>
      friendRequestsRepo.getFriendRequests();
  Future<Either<AppFailures, String>> accept(String id) =>
      friendRequestsRepo.acceptFriendRequest(id);
  Future<Either<AppFailures, String>> decline(String id) =>
      friendRequestsRepo.declineFriendRequest(id);
}