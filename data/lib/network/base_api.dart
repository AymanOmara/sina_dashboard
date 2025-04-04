import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';
import 'package:dio/dio.dart';
import 'package:domain/common/exceptions/general_exception.dart';
import 'package:domain/common/exceptions/json_parsing_exception.dart';
import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/exceptions/no_connection.dart';
import 'package:domain/common/exceptions/refresh_token_exception.dart';
import 'package:domain/common/refresh_token_exception_handler.dart';
import 'package:domain/common/result.dart';
import 'decode_able.dart';
import 'i_base_api.dart';

class BaseApi implements IAPIService {
  final Dio _dio;
  final IRefreshTokenExceptionHandler _exceptionHandler;

  BaseApi(this._dio, this._exceptionHandler) {
    _dio.options.connectTimeout = Duration(seconds: 10);
    _dio.options.receiveTimeout = Duration(seconds: 10);
  }

  @override
  Future<Result<T?, NetworkException>> fetchData<T>(
    IRemoteTarget targetType, {
    DecodeAble? data,
  }) async {
    try {
      var response = await _dio.fetch(_createRequestOptions(targetType));
      return Success(
        data?.fromJson(response.data),
      );
    } on RefreshTokenException catch (_) {
      _exceptionHandler.onRefreshTokenExpired();
      return Failure(RefreshTokenException());
    } on FormatException catch (error) {
      return Failure(JsonParsingException(error.message));
    } on DioException catch (_) {
      return Failure(NoConnection());
    } on TypeError catch (_) {
      return Failure(GeneralException());
    }
  }

  RequestOptions _createRequestOptions(IRemoteTarget targetType) {
    return RequestOptions(
      method: targetType.method.value,
      headers: targetType.headers,
      path: targetType.path!,
      baseUrl: Urls.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (code) => code != 401,
      data: targetType.body,
      queryParameters: targetType.queryParameters,
    );
  }
}
