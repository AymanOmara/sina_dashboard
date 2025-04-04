import 'package:domain/features/authentication/entities/user_entity.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class FetchUserDetailsUseCase {
  final IUserLocal _userLocal;

  const FetchUserDetailsUseCase(this._userLocal);

  UserEntity? call() {
    return _userLocal.getUser();
  }
}
