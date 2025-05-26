import 'package:chat_box/features/auth/data/models/register_request.dart';
import 'package:chat_box/features/auth/data/models/register_response.dart';

abstract class AuthRemoteDs{
  Future<RegisterResponse> register({RegisterRequest? request});
}