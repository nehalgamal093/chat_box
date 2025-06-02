import 'package:chat_box/features/messages/data/models/chatted_users.dart';
import 'package:chat_box/features/messages/domain/repository/chatted_users_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/AppFailures/app_failures.dart';


@injectable
class ChattedUsersUseCase {
  ChattedUsersRepo chattedUsersRepo;
  ChattedUsersUseCase(this.chattedUsersRepo);
  Future<Either<AppFailures, ChattedUsers>> call() =>
      chattedUsersRepo.getChattedUsers();
}
