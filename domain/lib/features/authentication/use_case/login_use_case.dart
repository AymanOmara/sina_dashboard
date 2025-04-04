import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/entities/user_entity.dart';
import 'package:domain/features/authentication/repositories/i_auth_repository.dart';

class LoginUseCase {
  final IAuthRepository _repository;

  const LoginUseCase(this._repository);

  Future<Result<UserEntity?, NetworkException>> call(
    String email,
    String password,
    Future<String?> Function() fcmGenerator,
  ) async {
    return await _repository.login(
      email,
      password,
      fcmGenerator,
    );
  }
}
