import 'package:domain/features/authentication/use_case/login_use_case.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class LogoutUseCase{
  final IUserLocal _userLocal;
  const LogoutUseCase(this._userLocal);
  void call(){
    _userLocal.logout();
  }
}