import 'package:chat_box/core/network/api_manager/api_manager.dart';
import 'package:chat_box/features/user_profile/data/data_source/remote_data_source/user_profile_remote_ds.dart';
import 'package:chat_box/features/user_profile/data/models/change_photo_response.dart';
import 'package:chat_box/features/user_profile/data/models/user_profile.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/caching/cache_helper.dart';
import '../../../../../core/resources/strings/endpoints.dart';
import '../../../../auth/data/data_source/remote_ds/auth_remote_ds_impl.dart';

@Injectable(as: UserProfileRemoteDs)
class UserProfileRemoteDsImpl extends UserProfileRemoteDs {
  APIManager apiManager;
  UserProfileRemoteDsImpl(this.apiManager);

  @override
  Future<UserProfile> getUserProfile(String id) async {
    var response = await apiManager.getRequest(
      Endpoints.userProfile(id),
      headers: {
        "token": CacheHelper.getToken(),
      },
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserProfile.fromJson(response.data);
      } else {
        String errorMessage = "User profile Failed";
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
  Future<String> cancelFriendRequest(String id) async {
    var response = await apiManager.postRequest(
      Endpoints.sendFriendRequest(id),
      {},
      headers: {"token": CacheHelper.getToken()},
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['message'];
      } else {
        String errorMessage = "Send Request Failed";
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
  Future<String> sendFriendRequest(String id) async {
    var response = await apiManager.postRequest(
      Endpoints.cancelFriendRequest(id),
      {},
      headers: {"token": CacheHelper.getToken()},
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['message'];
      } else {
        String errorMessage = "Cancel Request Failed";
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
  Future<ChangePhotoResponse> changeMyPhoto(String file) async {
    FormData formData = FormData.fromMap({
      "profilePicture": await MultipartFile.fromFile(file, filename: file),
    });

    var response = await apiManager.putRequest(
      Endpoints.changeMyPhoto,
      formData,
      headers: {
        "token": CacheHelper.getToken(),
        'Content-Type': 'multipart/form-data',
      },
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        ChangePhotoResponse changePhotoResponse = ChangePhotoResponse.fromJson(
          response.data,
        );
        return changePhotoResponse;
      } else {
        String errorMessage = "Uploading photo Failed";
        if (response.data is Map<String, dynamic>) {
          print('💲${response.data}');
          errorMessage = response.data['error'] ?? errorMessage;
        }

        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<String> updateBio(String bio) async{
    var response = await apiManager.putRequest(
      Endpoints.changeMyBio,
      {
        "bio":bio
      },
      headers: {"token": CacheHelper.getToken()},
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['message'];
      } else {
        String errorMessage = "Cancel Request Failed";
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
