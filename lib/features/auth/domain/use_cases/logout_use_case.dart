import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/AppFailures/app_failures.dart';
import '../repository/auth_repo.dart';

@injectable
class LogoutUseCase {
  AuthRepo authRepo;
  LogoutUseCase(this.authRepo);
  Future<Either<AppFailures, String>> call() => authRepo.logout();
}
