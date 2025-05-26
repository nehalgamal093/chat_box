import 'package:chat_box/core/network/AppFailures/app_failures.dart';
import 'package:chat_box/features/auth/data/models/register_request.dart';
import 'package:chat_box/features/auth/data/models/register_response.dart';
import 'package:chat_box/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepo authRepo;
  RegisterUseCase(this.authRepo);
  Future<Either<AppFailures, RegisterResponse>> call({
    RegisterRequest? request,
  }) => authRepo.register(request: request);
}
