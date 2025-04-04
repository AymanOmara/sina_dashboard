import 'package:data/common/response_entity_mapper.dart';
import 'package:data/features/authentication/model/delete_account_model.dart';
import 'package:data/features/authentication/model/user_model.dart';
import 'package:data/features/authentication/request/delete_account_request.dart';
import 'package:data/features/authentication/request/login_request.dart';
import 'package:data/features/authentication/request/register_fcm_token_request.dart';
import 'package:data/features/authentication/request/registration_request.dart';
import 'package:data/network/base_response.dart';

import 'package:data/network/i_base_api.dart';
import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/response.dart';

import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/entities/registration_entity.dart';
import 'package:domain/features/authentication/entities/user_entity.dart';
import 'package:domain/features/authentication/repositories/i_auth_repository.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class AuthRepository implements IAuthRepository {
  final IAPIService _service;
  final IUserLocal _userLocal;

  const AuthRepository(
    this._service,
    this._userLocal,
  );

  @override
  Future<Result<UserEntity?, NetworkException>> login(
    String email,
    String password,
    Future<String?> Function() fcmGenerator,
  ) async {
    String? fcmToken = _userLocal.getFcmToken;
    if (fcmToken.isEmpty) {
      fcmToken = await fcmGenerator();
    }
    var result = await _service.fetchData<UserModel>(
      LoginRequest(
        email: email,
        password: password,
        fcmToken: fcmToken ?? "",
      ),
      data: UserModel(),
    );
    return result.fold(onSuccess: (data) {
      if (data != null) {
        _userLocal.saveUser(data.toEntity());
        return Success(data.toEntity());
      }
      return Success(null);
    }, onFailure: (e) {
      return Failure(e);
    });
  }

  @override
  Future<Result<bool, NetworkException>> deleteAccount() async {
    var result = await _service.fetchData<DeleteAccountModel>(
        DeleteAccountRequest(userId: _userLocal.getUser()?.userId ?? 0),
        data: DeleteAccountModel());
    return result.fold(
        onSuccess: (data) {
          return Success(data?.success ?? false);
        },
        onFailure: (e) => Failure(e));
  }

  @override
  Future<Result<UserEntity?, NetworkException>> createUser(
    RegistrationEntity entity,
  ) async {
    var result = await _service.fetchData<UserModel>(
        RegistrationRequest(data: entity),
        data: UserModel());
    return result.fold(onSuccess: (data) {
      return Success(data?.toEntity());
    }, onFailure: (e) {
      return Failure(e);
    });
  }

  @override
  Future<Result<Response<bool>?, NetworkException>> registerFcmToken() async {
    var login = _userLocal.login;
    if (_userLocal.getFcmToken.isEmpty || !login) {
      return Success(
        Response<bool>(
          data: true,
          success: true,
          statusCode: 200,
        ),
      );
    }
    var result = await _service.fetchData<BaseResponse<bool>>(
      RegisterFcmTokenRequest(
        fcmToken: _userLocal.getFcmToken,
        userId: _userLocal.getUser()?.userId ?? 0,
      ),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data?.toEntity(data.data ?? false));
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }
}
