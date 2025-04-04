import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/home/repository/i_home_repository.dart';

class HomeBannerUseCase {
  final IHomeRepository _repository;

  const HomeBannerUseCase(this._repository);

  Future<Result<List<String>, NetworkException>> call() {
    return _repository.fetchBanners();
  }
}
