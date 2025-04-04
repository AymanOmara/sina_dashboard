import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/repositories/i_auth_repository.dart';

class DeleteAccountUseCase {
  final IAuthRepository _authRepository;

  const DeleteAccountUseCase(this._authRepository);

  Future<Result<bool,NetworkException>> call() async {
    return await _authRepository.deleteAccount();
  }
}
