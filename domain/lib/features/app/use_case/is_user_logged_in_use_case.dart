import 'package:domain/locale_storage/i_user_local.dart';

class IsUserLoggedInUseCase {
  final IUserLocal _userLocal;

  const IsUserLoggedInUseCase(this._userLocal);

  bool call() {
    return _userLocal.login;
  }
}
