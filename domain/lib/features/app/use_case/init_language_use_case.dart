import 'package:domain/locale_storage/i_user_local.dart';

class InitLanguageUseCase {
  final IUserLocal _userLocal;

  const InitLanguageUseCase(this._userLocal);

  void call(String defaultLanguage) {
    _userLocal.setLocale(defaultLanguage);
  }
}
