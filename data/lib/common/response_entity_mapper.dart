import 'package:data/network/base_response.dart';
import 'package:domain/common/response.dart';

extension ResponseEntityMapper on BaseResponse {
  Response<T> toEntity<T>(T data) {
    return Response<T>(
      data: data,
      success: success ?? false,
      message: message ?? "",
    );
  }
}
