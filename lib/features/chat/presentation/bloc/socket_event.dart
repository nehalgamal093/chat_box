part of 'socket_bloc.dart';

abstract class SocketEvent {
  const SocketEvent();

  List<Object> get props => [];
}

class SocketConnect extends SocketEvent {
  @override
  List<Object> get props => [];
}

class SocketDisconnect extends SocketEvent {}

class SendMessage extends SocketEvent {
  final Message message;
  const SendMessage(this.message);

  @override
  List<Object> get props => [message];
}

class SendMessageWithFile extends SocketEvent {
  final Message message;
  final String file;
  const SendMessageWithFile(this.message, this.file);

  @override
  List<Object> get props => [message, file];
}

class LoadMessages extends SocketEvent {
  final String otherUserId;
  const LoadMessages(this.otherUserId);

  @override
  List<Object> get props => [otherUserId];
}
class LoadInitialMessage extends SocketEvent {
  final String otherUserId;
  const LoadInitialMessage(this.otherUserId);

  @override
  List<Object> get props => [otherUserId];
}
class LoadMoreMessages extends SocketEvent {
  final String otherUserId;
  const LoadMoreMessages(this.otherUserId);

  @override
  List<Object> get props => [otherUserId];
}

class NewMessageReceived extends SocketEvent {
  final Message message;

  const NewMessageReceived(this.message);
  @override
  List<Object> get props => [message];
}

class ChatClosedEvent extends SocketEvent {
}