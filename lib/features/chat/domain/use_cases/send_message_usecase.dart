import 'dart:io';

import 'package:chat_box/features/chat/data/models/send_message_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/AppFailures/app_failures.dart';
import '../repository/chat_repo.dart';

@injectable
class SendMessageUseCase {
  ChatRepo chatRepo;
  SendMessageUseCase(this.chatRepo);
  Future<Either<AppFailures, SendMessageResponse>> call(
    String message,

    String id,
  ) => chatRepo.sendMessage(message, id);
}
