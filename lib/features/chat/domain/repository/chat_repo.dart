import 'dart:io';

import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/chat/data/models/message.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/send_message_response.dart';

abstract class ChatRepo {
  Future<Either<AppFailures, Messages>> getMessages(String id);
  Future<Either<AppFailures, SendMessageResponse>> sendMessage(
    String message,
    String id,
  );
  Future<Either<AppFailures, SendMessageResponse>> sendMessageAndFile(
    String message,
    String id,
    String file,
  );
}
