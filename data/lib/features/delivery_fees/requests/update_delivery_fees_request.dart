import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class UpdateDeliveryFeesRequest extends IRemoteTarget {
  final Map<String, dynamic> data;

  UpdateDeliveryFeesRequest({required this.data}) {
    body = data;
  }

  @override
  String get path => Urls.updateDeliveryFees;

  @override
  HttpMethod get method => HttpMethod.post;
}
