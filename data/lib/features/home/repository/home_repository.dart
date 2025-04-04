import 'package:data/features/home/model/banner_model.dart';
import 'package:data/features/home/request/get_home_banner_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/home/repository/i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  final IAPIService _apiService;

  const HomeRepository(this._apiService);

  @override
  Future<Result<List<String>, NetworkException>> fetchBanners() async {
    var result =
        await _apiService.fetchData<BannerModel>(GetHomeBannerRequest(),data: BannerModel());
    return result.fold(onSuccess: (data) {
      return Success(data?.urls ?? []);
    }, onFailure: (e) {
      return Failure(e);
    });
  }
}
