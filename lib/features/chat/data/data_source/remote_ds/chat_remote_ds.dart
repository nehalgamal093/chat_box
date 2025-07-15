import 'dart:io';
import 'package:chat_box/features/chat/data/models/message.dart';
import '../../models/send_message_response.dart';

abstract class ChatRemoteDs{
  Future<Messages> getMessages(String id,String page);
  Future<SendMessageResponse> sendMessage(String message,String id);
  Future<SendMessageResponse> sendMessageAndFile(String message,String id, String file);
}