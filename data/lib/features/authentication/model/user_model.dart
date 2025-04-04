import 'dart:convert';

import 'package:data/network/decode_able.dart';
import 'package:domain/features/authentication/entities/user_entity.dart';
import 'package:xml/xml.dart';

class UserModel implements DecodeAble<UserModel?, Map<String, dynamic>> {
  int? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? userPhone;
  String? userPhoto;

  UserModel({
    this.userEmail,
    this.userId,
    this.userName,
    this.userPassword,
    this.userPhone,
    this.userPhoto,
  });

  @override
  UserModel? fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userid'] ?? 0,
      userName: json['username'] ?? '',
      userEmail: json['useremail'] ?? '',
      userPassword: json['userpassword'] ?? '',
      userPhone: json['userphone'] ?? '',
      userPhoto: json['userphoto'] ?? '',
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      userId: userId ?? 0,
      userName: userName ?? "",
      userEmail: userEmail ?? "",
      userPassword: userPassword ?? "",
      userPhone: userPhone ?? "",
      userPhoto: userPhoto ?? "",
    );
  }
}
