import 'package:domain/features/authentication/entities/user_entity.dart';

abstract interface class IUserLocal {
  String get getLocale;

  void setLocale(String locale);

  void logout();

  bool get login;

  void saveUser(UserEntity user);

  UserEntity? getUser();

  void setFcmToken(String fcmToken);

  String get getFcmToken;
}
