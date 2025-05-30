import 'package:chat_box/features/friends/domain/repository/friends_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/AppFailures/app_failures.dart';
import '../../data/models/friends.dart';

@injectable
class GetFriendsUseCase {
  FriendsRepo friendsRepo;
  GetFriendsUseCase(this.friendsRepo);
  Future<Either<AppFailures, Friends>> call() =>
      friendsRepo.getFriends();
}
