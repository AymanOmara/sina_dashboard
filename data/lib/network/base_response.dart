import 'decode_able.dart';

class BaseResponse<T> implements DecodeAble<BaseResponse<T?>, Map?> {
  DecodeAble? decodeAble;
  T? data;
  String? message;
  bool? success;

  BaseResponse({
    this.decodeAble,
    this.data,
    this.message,
    this.success,
  });

  @override
  BaseResponse<T?> fromJson(json) {
    return BaseResponse<T?>(
      data: json?.containsKey("data") == true
          ? decodeAble?.fromJson(json?["data"] ?? {})
          : null,
      message: json?["message"],
      success: json?["success"],
    );
  }
}
