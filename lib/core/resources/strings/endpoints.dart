import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints{
  static  String register = dotenv.env['REGISTER_ENDPOINT']!;
  static  String login = dotenv.env['LOGIN_ENDPOINT']!;
  static  String friends = dotenv.env['FRIENDS_ENDPOINT']!;
  static  String getMessages(String id,String page) => '${dotenv.env['MESSAGES_ENDPOINT']!}/$id/$page';
  static  String sendMessage(String id) => '${dotenv.env['SEND_MESSAGE']!}/$id';
  static  String chattedUsers = dotenv.env['CHATTED_USERS']!;
  static  String userProfile(String id) => '${dotenv.env['USER_PROFILE']!}/$id';
  static  String friendRequests = dotenv.env['FRIEND_REQUEST']!;
  static  String acceptRequest(String id) => '${dotenv.env['ACCEPT_REQUEST']!}/$id';
  static  String declineRequest(String id) => '${dotenv.env['DECLINE_REQUEST']!}/$id';
  static  String search(String keyword) => '${dotenv.env['SEARCH_REQUEST']!}?term=$keyword';
  static  String changeMyPhoto = dotenv.env['UPLOAD_MY_PHOTO_REQUEST']!;
  static  String sendFriendRequest(String id) => '${dotenv.env['SEND_FRIEND_REQUEST']!}/$id';
  static  String cancelFriendRequest(String id) => '${dotenv.env['CANCEL_FRIEND_REQUEST']!}/$id';
}