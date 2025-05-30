import 'dart:async';

import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import '../../../features/chat/data/models/message.dart';

@injectable
class SocketService {
  io.Socket? socket;
  var logger = Logger();
  final _incomingMessagesController = StreamController<Message>.broadcast();
  Stream<Message> get incomingMessages => _incomingMessagesController.stream;
  Future<void> connect() async {
    try{
      socket =  io.io(
        dotenv.env['SOCKET_URL'],
        io.OptionBuilder()
            .setTransports(['websocket'])
            .setQuery({'userId': CacheHelper.getUserId()})
            .enableForceNewConnection()
            .build(),
      );

      socket!.on('newMessage', (data) {
        logger.d(data);
        try {
          final message = Message.fromJson(data as Map<String, dynamic>);
          _incomingMessagesController.add(message);
        } catch (e) {
          print('Error parsing incoming message: $e');
        }
      });
      // socket!.connect();
      socket!.onConnect((data)=>logger.i('Connected'));
      socket!.onDisconnect((data)=>print('diss $data'));
      socket!.onError((error)=>print('error $error'));


    } catch(e){
      logger.e('error',error:e);
    }
  }
  Future<void> disconnect() async{
    socket?.disconnect();
    socket?.dispose();
    socket = null;
  }

  // Future<void> sendMessage(Message message) async {
  //   socket?.emit('newMessage', message.toJson());
  // }

}
