import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:ibn_sina_flutter/core/routing/app_routes.dart';
import 'package:ibn_sina_flutter/features/home/display/home_service_display.dart';

import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  LoadingState loadingState = Loading();

  final List<HomeServiceDisplay> services = [
    HomeServiceDisplay(
      title: 'products'.tr,
      route: AppRoutes.products,
    ),
    HomeServiceDisplay(
      title: 'الطلبات'.tr,
      route: AppRoutes.order,
    ),
    HomeServiceDisplay(
      title: 'رسوم الشحن'.tr,
      route: AppRoutes.deliveryFees,
    ),
  ];
}
