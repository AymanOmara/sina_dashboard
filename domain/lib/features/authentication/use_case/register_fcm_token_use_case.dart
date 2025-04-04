import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/repositories/i_auth_repository.dart';

class RegisterFcmTokenUseCase {
  final IAuthRepository _authRepository;

  const RegisterFcmTokenUseCase(this._authRepository);

  Future<Result<Response<bool>?, NetworkException>> call() async {
    return await _authRepository.registerFcmToken();
  }
}
