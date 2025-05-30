import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints{
  static  String register = dotenv.env['REGISTER_ENDPOINT']!;
  static  String login = dotenv.env['LOGIN_ENDPOINT']!;
  static  String friends = dotenv.env['FRIENDS_ENDPOINT']!;
  static  String getMessages(String id) => '${dotenv.env['MESSAGES_ENDPOINT']!}/$id';
  static  String sendMessage(String id) => '${dotenv.env['SEND_MESSAGE']!}/$id';
}