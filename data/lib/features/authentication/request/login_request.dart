import 'dart:convert';

import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class LoginRequest extends IRemoteTarget {
  final String email;
  final String password;
  final String fcmToken;

  LoginRequest({
    required this.email,
    required this.password,
    required this.fcmToken,
  }) {
    body = {
      "identifier": email,
      "password": password,
      "fcmToken": fcmToken,
    };
  }

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String? get path => Urls.login;
}
