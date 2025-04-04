import 'package:data/locale/locale_keys.dart';
import 'package:domain/features/authentication/entities/user_entity.dart';
import 'package:domain/locale_storage/i_user_local.dart';
import 'package:get_storage/get_storage.dart';

class UserLocal implements IUserLocal {
  final GetStorage _storage;

  UserLocal(this._storage);

  @override
  String get getLocale => _storage.read(LocaleKeys.locale) ?? "";

  @override
  void setLocale(String locale) {
    _storage.write(LocaleKeys.locale, locale);
  }

  @override
  bool get login => getUser() != null;

  @override
  void logout() {
    _storage.write("user", null);
  }

  @override
  void saveUser(UserEntity user) {
    _storage.write("user", user.toJson());
  }

  @override
  UserEntity? getUser() {
    final Map<String, dynamic>? userData = _storage.read("user");
    if (userData != null) {
      return UserEntity.fromJson(userData);
    }
    return null;
  }

  @override
  void setFcmToken(String fcmToken) {
    _storage.write(LocaleKeys.fcmToken, fcmToken);
  }

  @override
  String get getFcmToken => _storage.read(LocaleKeys.fcmToken) ?? "";
}
