import 'dart:async';

import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import '../../../features/chat/data/models/message.dart';

@singleton
class SocketService {
  io.Socket? socket;
  static final SocketService _instance = SocketService._internal();

  factory SocketService() => _instance;

  SocketService._internal();
  var logger = Logger();
  final _incomingMessagesController = StreamController<Message>.broadcast();
  Stream<Message> get incomingMessages => _incomingMessagesController.stream;
  final _onlineUsersController = StreamController<List<dynamic>>.broadcast();
  Stream<List<dynamic>> get onlineList => _onlineUsersController.stream;
  Future<void> connect() async {
    socket = io.io(
      dotenv.env['SOCKET_URL'],
      io.OptionBuilder()
          .setTransports(['websocket'])
          .setQuery({'userId': CacheHelper.getUserId()})
          .enableForceNewConnection()
          .build(),
    );
    setupSocketListeners();
    socket?.connect();
  }

  Future<void> setupSocketListeners() async {
    if (socket == null) {
      await connect();
    }

      socket!.on('newMessage', (data) {
        print('🎀 on new message');
        try {
          final message = Message.fromJson(data as Map<String, dynamic>);
          _incomingMessagesController.add(message);
        } catch (e) {
        }

      });
    socket!.on('user-online-chat', (data) {
      logger.d("📡 Socket received raw data: ${data}");
      try {
        print("📨 Is user online: ${data}");
      } catch (e) {
        print('❌ Error parsing incoming message: $e');
      }

    });
    socket?.on('getOnlineUsers',(data){
      _onlineUsersController.add(data);
    });
      socket!.onConnect((data) => logger.i('Connected $data' ));
      socket!.onDisconnect((data) =>logger.i('Disconnected $data'));
      socket!.onError((error) => print('error $error'));

  }
  Future<void> sendMessage(Message message) async {
    socket?.emit('newMessage', message.toJson());
  }
  Future<void> chatOpened() async {
    socket?.emit('user-online-chat');
  }
  Future<void> notifyChatClosed() async {

    socket?.emit('chat-disconnected');
  }

  Future<void> disconnect() async {
    socket?.disconnect();
    socket?.dispose();
  }

}
