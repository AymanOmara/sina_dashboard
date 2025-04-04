import 'package:domain/locale_storage/i_user_local.dart';

class UpdateLanguageUseCase {
  final IUserLocal _userLocal;

  const UpdateLanguageUseCase(this._userLocal);

  void call(String deviceLanguage) {
    _userLocal.setLocale(deviceLanguage);
  }
}
