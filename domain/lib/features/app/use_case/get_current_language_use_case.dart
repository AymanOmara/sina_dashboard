import 'package:domain/locale_storage/i_user_local.dart';

class GetCurrentLanguageUseCase {
  final IUserLocal _userLocal;

  const GetCurrentLanguageUseCase(this._userLocal);

  String call() {
    return _userLocal.getLocale;
  }
}
