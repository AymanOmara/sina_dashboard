import 'package:data/network/decode_able.dart';

class DeleteAccountModel
    implements DecodeAble<DeleteAccountModel?, Map<String, dynamic>> {
  bool? success;

  DeleteAccountModel({
    this.success,
  });

  @override
  DeleteAccountModel? fromJson(Map<String, dynamic> json) {
    return DeleteAccountModel(success: json["success"]);
  }
}
