import 'package:chat_box/features/chat/data/models/message.dart';
import 'package:chat_box/features/chat/domain/repository/chat_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/AppFailures/app_failures.dart';

@injectable
class ChatUseCase {
  ChatRepo chatRepo;
  ChatUseCase(this.chatRepo);
  Future<Either<AppFailures, Messages>> call(String id,String page) =>
      chatRepo.getMessages(id,page);
}