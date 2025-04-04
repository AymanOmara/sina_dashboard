import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/entities/registration_entity.dart';

import 'package:domain/features/authentication/entities/user_entity.dart';

abstract interface class IAuthRepository {
  Future<Result<UserEntity?, NetworkException>> login(
    String email,
    String password,
    Future<String?> Function() fcmGenerator,
  );

  Future<Result<bool, NetworkException>> deleteAccount();

  Future<Result<UserEntity?, NetworkException>> createUser(
    RegistrationEntity entity,
  );

  Future<Result<Response<bool>?, NetworkException>> registerFcmToken();
}
