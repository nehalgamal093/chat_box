part of 'socket_bloc.dart';

abstract class SocketState extends Equatable{
  const SocketState();

  @override
  List<Object> get props =>[];
}

class SocketInitial extends SocketState{

}

class SocketConnected extends SocketState {}

class SocketDisconnected extends SocketState {}

class LoadingMessages extends SocketState {}
class MessagesLoaded extends SocketState {
  final List<Message> messages;
  final bool hasReachedMax;
  const MessagesLoaded(this.messages, this.hasReachedMax);
  @override
  List<Object> get props => [messages];
}

class SocketError extends SocketState {
  final String error;
  const SocketError(this.error);
}