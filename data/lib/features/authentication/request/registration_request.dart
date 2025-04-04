import 'dart:convert';

import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';
import 'package:dio/dio.dart';
import 'package:domain/features/authentication/entities/registration_entity.dart';

class RegistrationRequest extends IRemoteTarget {
  final RegistrationEntity data;

  RegistrationRequest({
    required this.data,
  }) {
    body = {
      "userid": 0,
      "username": data.userName,
      "useremail": data.email,
      "userpassword": data.password,
      "userphone": "01158092582",
      "userphoto": data.userPhone,
      "createon": "2025-03-16T20:54:55.145Z"
    };
  }

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String? get path => Urls.createAccount;
}
