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
    var jsonData = json?.containsKey("data");
    var isPrimitive = jsonData.runtimeType == String ||
        jsonData.runtimeType == int ||
        jsonData.runtimeType == double ||
        jsonData.runtimeType == bool;
    return BaseResponse<T?>(
      data: json?.containsKey("data") == true
          ? isPrimitive
              ? json!["data"]
              : decodeAble?.fromJson(json?["data"] ?? {})
          : null,
      message: json?["message"],
      success: json?["success"],
    );
  }
}
