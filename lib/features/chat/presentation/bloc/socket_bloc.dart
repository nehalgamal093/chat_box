import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chat_box/core/resources/socket/socket_service.dart';
import 'package:chat_box/features/chat/domain/use_cases/chat_use_case.dart';
import 'package:chat_box/features/chat/domain/use_cases/send_message_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/di/di.dart';
import '../../data/models/message.dart';

part 'socket_event.dart';
part 'socket_state.dart';

@injectable
class SocketBloc extends Bloc<SocketEvent, SocketState> {
  ChatUseCase chatUseCase;
  SendMessageUseCase sendMessageUseCase;
  StreamSubscription? _messageSubscription;

  SocketBloc(this.chatUseCase, this.sendMessageUseCase)
      : super(SocketInitial()) {
    on<SocketConnect>(_onConnect);
    on<SocketDisconnect>(_onDisconnect);
    on<SendMessage>(_onSendMessage);
    on<SendMessageWithFile>(_onSendMessageWithFile);
    on<LoadInitialMessage>(_loadInitialMessages);
    on<LoadMoreMessages>(_onLoadMoreMessages);
    on<NewMessageReceived>(_onNewMessageReceived);
    on<ChatClosedEvent>(_onChatClosed);
  }
  final socketService = getIt<SocketService>();
  int page = 0;
  final int _limit = 15;
  bool _hasReachedMax = false;
  void _onConnect(SocketConnect event, Emitter<SocketState> emit) async {
    _messageSubscription = socketService.incomingMessages.listen(
      (message) {
        add(NewMessageReceived(message));
      },
    );
    await socketService.chatOpened();

  }

  void _onDisconnect(SocketDisconnect event, Emitter<SocketState> emit) async {
    await socketService.disconnect();
    emit(SocketDisconnected());
  }

  void _onSendMessage(SendMessage event, Emitter<SocketState> emit) async {
    final currentMessages = (state as MessagesLoaded).messages;
    if (state is MessagesLoaded) {
      socketService.sendMessage(event.message);
    emit(MessagesLoaded([event.message, ...currentMessages], false));
    }
  }

  void _onSendMessageWithFile(
    SendMessageWithFile event,
    Emitter<SocketState> emit,
  ) async {
    final currentMessages = (state as MessagesLoaded).messages;
    if (state is MessagesLoaded) {
      emit(MessagesLoaded([event.message, ...currentMessages], false));
    }
    try {
      var result = await sendMessageUseCase.callWithFile(
        event.message.message!,
        event.message.receiverId!,
        event.file,
      );
      result.fold(
        (error) {
          emit(SocketError('Failed to get messages: $error'));
        },
        (model) {
          Message message = Message(
            message: model.newMessage?.message,
            mediaType: model.newMessage?.mediaType ?? "none",
            receiverId: model.newMessage?.receiverId,
            mediaUrl: model.newMessage?.mediaUrl ,
            senderId: model.newMessage?.senderId,
            createdAt: model.newMessage?.createdAt,
            updatedAt: model.newMessage?.updatedAt,
          );
          emit(MessagesLoaded([message, ...currentMessages], false));
        },
      );
    } catch (e) {
      emit(SocketError('Failed to send message: $e'));
    }
  }

  void _loadInitialMessages(
    LoadInitialMessage event,
    Emitter<SocketState> emit,
  ) async {
    emit(LoadingMessages());
    _hasReachedMax = false;
    var result = await chatUseCase.call(event.otherUserId, page.toString());
    result.fold(
      (error) {
        emit(SocketError('Failed to get messages: $error'));
      },
      (model) {
        emit(
          MessagesLoaded(
            model.messagesList!,
            model.messagesList!.length < _limit,
          ),
        );
        page++;
      },
    );
  }

  void _onLoadMoreMessages(
    LoadMoreMessages event,
    Emitter<SocketState> emit,
  ) async {
    if (state is MessagesLoaded) {
      final currentState = state as MessagesLoaded;
      if (currentState.hasReachedMax) return;
      emit(MessagesLoaded(currentState.messages, true));
      var result = await chatUseCase.call(event.otherUserId, page.toString());

      result.fold(
        (error) {
          emit(SocketError('Failed to get messages: $error'));
        },
        (model) {
          _hasReachedMax = model.messagesList!.length < _limit;
          emit(
            MessagesLoaded([
              ...currentState.messages,
              ...model.messagesList!,
            ], model.messagesList!.length < _limit),
          );
          page++;
        },
      );
    }
  }

  void _onNewMessageReceived(
    NewMessageReceived event,
    Emitter<SocketState> emit,
  ) async {
    if (state is MessagesLoaded) {

      final currentMessages = (state as MessagesLoaded).messages;
      emit(MessagesLoaded([event.message, ...currentMessages], false));
    } else {

    }
  }
  void _onChatClosed(ChatClosedEvent event, Emitter<SocketState> emit) async {

    await socketService.notifyChatClosed();
    await socketService.disconnect();
  }
}
