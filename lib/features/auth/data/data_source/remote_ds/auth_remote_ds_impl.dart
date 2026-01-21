import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:chat_box/core/resources/strings/endpoints.dart';
import 'package:chat_box/features/auth/data/data_source/remote_ds/auth_remote_ds.dart';
import 'package:chat_box/features/auth/data/models/login_response.dart';
import 'package:chat_box/features/auth/data/models/register_request.dart';
import 'package:chat_box/features/auth/data/models/register_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_manager/api_manager.dart';
import '../../../../../core/services/notification_service/notification_service.dart';

@Injectable(as: AuthRemoteDs)
class AuthRemoteDsImpl extends AuthRemoteDs {
  APIManager apiManager;
  AuthRemoteDsImpl(this.apiManager);
  @override
  Future<RegisterResponse> register({RegisterRequest? request}) async {
    var response = await apiManager.postRequest(
      Endpoints.register,
      request!.toJson(),
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterResponse.fromJson(response.data);
      } else {
        String errorMessage = "Register Failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['error'] ?? errorMessage;
        }
        print("🎃 ${errorMessage} or  ${response.data}");
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<LoginResponse> login(String email, String password) async {
    String? token = await NotificationService.instance.getToken();
    var response = await apiManager.postRequest(Endpoints.login, {
      "email": email,
      "password": password,
      "fcmToken":token
    });
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        CacheHelper.saveToken(loginResponse.token!);
        CacheHelper.saveUserId(loginResponse.id!);
        return loginResponse;
      } else {
        String errorMessage = "Login Failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['error'] ?? errorMessage;
        }
        print('🚕 ${errorMessage}');
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<String> logout() async{
    var response = await apiManager.postRequest(Endpoints.logout,{}, headers: {"token": CacheHelper.getToken()},);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        String message = response.data['message'];

        return message;
      } else {
        String errorMessage = "Logout Failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['error'] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }
}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}
