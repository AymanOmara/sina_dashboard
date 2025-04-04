import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';

abstract interface class IHomeRepository {
  Future<Result<List<String>, NetworkException>> fetchBanners();
}
