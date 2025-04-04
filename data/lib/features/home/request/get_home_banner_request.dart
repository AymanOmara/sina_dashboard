import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class GetHomeBannerRequest extends IRemoteTarget {
  @override
  String? get path => Urls.banner;
}
