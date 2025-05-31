import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:chat_box/core/resources/socket/socket_service.dart';
import 'package:chat_box/features/chat/domain/use_cases/chat_use_case.dart';
import 'package:chat_box/features/chat/domain/use_cases/send_message_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/message.dart';

part 'socket_event.dart';
part 'socket_state.dart';

@injectable
class SocketBloc extends Bloc<SocketEvent, SocketState> {
  final SocketService socketService;
  ChatUseCase chatUseCase;
  SendMessageUseCase sendMessageUseCase;
  StreamSubscription? _messageSubscription;
  SocketBloc(this.socketService, this.chatUseCase, this.sendMessageUseCase)
    : super(SocketInitial()) {
    on<SocketConnect>(_onConnect);
    on<SocketDisconnect>(_onDisconnect);
    on<SendMessage>(_onSendMessage);
    on<SendMessageWithFile>(_onSendMessageWithFile);
    on<LoadMessages>(_onLoadMessage);
    on<NewMessageReceived>(_onNewMessageReceived);
  }

  void _onConnect(SocketConnect event, Emitter<SocketState> emit) async {
    try {
      await socketService.connect();
      emit(SocketConnected());
      _messageSubscription = socketService.incomingMessages.listen(
        (message) => add(NewMessageReceived(message)),
      );
    } catch (e) {
      emit(SocketError('Connection failed: $e'));
    }
  }

  void _onDisconnect(SocketDisconnect event, Emitter<SocketState> emit) async {
    await socketService.disconnect();
    emit(SocketDisconnected());
  }

  void _onSendMessage(SendMessage event, Emitter<SocketState> emit) async {
    final currentMessages = (state as MessagesLoaded).messages;
    if (state is MessagesLoaded) {
      emit(MessagesLoaded([...currentMessages, event.message]));
    }
    try {
      var result = await sendMessageUseCase.call(
        event.message.message!,
        event.message.receiverId!,
      );
      result.fold(
        (error) {
          print('SocketError $error');
          // emit(SocketError('Failed to get messages: $error'));
        },
        (model) {
          Message message = Message(
            message: model.newMessage?.message,
            mediaType: model.newMessage?.mediaType ?? "none",
            receiverId: model.newMessage?.receiverId,
            mediaUrl: model.newMessage?.mediaUrl ?? null,
            senderId: model.newMessage?.senderId,
            createdAt: model.newMessage?.createdAt,
            updatedAt: model.newMessage?.updatedAt,
          );
          emit(MessagesLoaded([...currentMessages, message]));
        },
      );
    } catch (e) {
      print('error send $e');
      // emit(SocketError('Failed to send message: $e'));
    }
  }

  void _onSendMessageWithFile(
    SendMessageWithFile event,
    Emitter<SocketState> emit,
  ) async {
    final currentMessages = (state as MessagesLoaded).messages;
    if (state is MessagesLoaded) {
      emit(MessagesLoaded([...currentMessages, event.message]));
    }
    try {
      var result = await sendMessageUseCase.callWithFile(
        event.message.message!,
        event.message.receiverId!,
        event.file,
      );
      result.fold(
        (error) {
          print('SocketError $error');
          // emit(SocketError('Failed to get messages: $error'));
        },
        (model) {
          Message message = Message(
            message: model.newMessage?.message,
            mediaType: model.newMessage?.mediaType ?? "none",
            receiverId: model.newMessage?.receiverId,
            mediaUrl: model.newMessage?.mediaUrl ?? null,
            senderId: model.newMessage?.senderId,
            createdAt: model.newMessage?.createdAt,
            updatedAt: model.newMessage?.updatedAt,
          );
          emit(MessagesLoaded([...currentMessages, message]));
        },
      );
    } catch (e) {
      print('error send $e');
      // emit(SocketError('Failed to send message: $e'));
    }
  }

  void _onLoadMessage(LoadMessages event, Emitter<SocketState> emit) async {
    emit(LoadingMessages());

    var result = await chatUseCase.call(event.otherUserId);
    result.fold(
      (error) {
        emit(SocketError('Failed to get messages: $error'));
      },
      (model) {
        emit(MessagesLoaded(model.messages!));
      },
    );
  }

  void _onNewMessageReceived(
    NewMessageReceived event,
    Emitter<SocketState> emit,
  ) async {
    print(event.message.message);
    if (state is MessagesLoaded) {
      final currentMessages = (state as MessagesLoaded).messages;
      emit(MessagesLoaded([...currentMessages, event.message]));
    }
  }
}
