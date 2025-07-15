import 'dart:io';

import 'package:chat_box/core/caching/cache_helper.dart';
import 'package:chat_box/core/network/api_manager/api_manager.dart';
import 'package:chat_box/features/chat/data/data_source/remote_ds/chat_remote_ds.dart';
import 'package:chat_box/features/chat/data/models/message.dart';
import 'package:chat_box/features/chat/data/models/send_message_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/strings/endpoints.dart';
import '../../../../auth/data/data_source/remote_ds/auth_remote_ds_impl.dart';

@Injectable(as: ChatRemoteDs)
class ChatRemoteDsImpl extends ChatRemoteDs {
  APIManager apiManager;
  ChatRemoteDsImpl(this.apiManager);

  @override
  Future<Messages> getMessages(String id,String page) async {
    var response = await apiManager.getRequest(
      Endpoints.getMessages(id,page),
      headers: {"token": CacheHelper.getToken()},
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Messages.fromJson(response.data);
      } else {
        String errorMessage = "Friends Failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['error'] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<SendMessageResponse> sendMessage(String message, String id) async {
    FormData formMessage = FormData.fromMap({"message": message});

    var response = await apiManager.postRequest(
      Endpoints.sendMessage(id),
      formMessage,
      headers: {
        "token": CacheHelper.getToken(),
        'Content-Type': 'multipart/form-data',
      },
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        SendMessageResponse sendMessageResponse = SendMessageResponse.fromJson(
          response.data,
        );
        return sendMessageResponse;
      } else {
        String errorMessage = "Sending Message Failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['error'] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<SendMessageResponse> sendMessageAndFile(
    String message,
    String id,
    String file,
  ) async {
    FormData formData = FormData.fromMap({
      "message": message,
      "file": await MultipartFile.fromFile(file, filename: file),
    });

    var response = await apiManager.postRequest(
      Endpoints.sendMessage(id),
      formData,
      headers: {
        "token": CacheHelper.getToken(),
        'Content-Type': 'multipart/form-data',
      },
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        SendMessageResponse sendMessageResponse = SendMessageResponse.fromJson(
          response.data,
        );
        return sendMessageResponse;
      } else {
        String errorMessage = "Sending Message Failed";
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
