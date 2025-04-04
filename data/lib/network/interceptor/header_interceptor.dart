import 'package:dio/dio.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  final IUserLocal userLocal;

  HeaderInterceptor(
    this.userLocal,
  );

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    Map<String, dynamic> headers = {
      "Accept-Language": userLocal.getLocale,
      "Accept": "application/json",
    };
    options.headers.addAll(headers);
    super.onRequest(options, handler);
  }
}
