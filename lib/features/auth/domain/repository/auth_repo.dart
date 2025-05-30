import 'package:chat_box/features/auth/data/models/login_response.dart';
import 'package:chat_box/features/auth/data/models/register_request.dart';
import 'package:chat_box/features/auth/data/models/register_response.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/AppFailures/app_failures.dart';

abstract class AuthRepo {
  Future<Either<AppFailures, RegisterResponse>> register({
    RegisterRequest? request,
  });
  Future<Either<AppFailures, LoginResponse>> login(
    String email,
    String password,
  );
}
