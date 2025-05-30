import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/auth/data/models/login_response.dart';
import 'package:chat_box/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepo authRepo;
  LoginUseCase(this.authRepo);
  Future<Either<AppFailures, LoginResponse>> call(
    String email,
    String password,
  ) => authRepo.login(email, password);
}
