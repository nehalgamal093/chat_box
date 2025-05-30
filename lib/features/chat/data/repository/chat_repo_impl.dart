import 'dart:io';

import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/chat/data/data_source/remote_ds/chat_remote_ds.dart';
import 'package:chat_box/features/chat/data/models/message.dart';
import 'package:chat_box/features/chat/data/models/send_message_response.dart';
import 'package:chat_box/features/chat/domain/repository/chat_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/AppFailures/remote_failures.dart';
import '../../../auth/data/data_source/remote_ds/auth_remote_ds_impl.dart';

@Injectable(as: ChatRepo)
class ChatRepoImpl extends ChatRepo {
  ChatRemoteDs chatRemoteDs;
  ChatRepoImpl(this.chatRemoteDs);

  @override
  Future<Either<AppFailures, Messages>> getMessages(String id) async {
    var result = await chatRemoteDs.getMessages(id);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }

  @override
  Future<Either<AppFailures, SendMessageResponse>> sendMessage(String message,String id) async{
    var result = await chatRemoteDs.sendMessage(message, id);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }
}
