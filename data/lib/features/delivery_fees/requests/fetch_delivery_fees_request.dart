import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class FetchDeliveryFeesRequest extends IRemoteTarget {
  @override
  String get path => Urls.fetchDeliveryFees;

  @override
  HttpMethod get method => HttpMethod.get;
}
