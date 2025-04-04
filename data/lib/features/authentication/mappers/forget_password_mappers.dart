import 'package:data/features/authentication/model/forget_password_model.dart';
import 'package:domain/features/authentication/entities/forget_password_entity.dart';

extension ForgetPasswordModelMapper on ForgetPasswordEntity {
  ForgetPasswordModel toModel() {
    return ForgetPasswordModel(
      email: email,
      password: password,
      otp: otp,
    );
  }
}
