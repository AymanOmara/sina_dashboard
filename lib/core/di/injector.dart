import 'package:domain/features/order/entity/order_entity.dart';
import 'package:get_it/get_it.dart';
import 'package:ibn_sina_flutter/features/add_update_product/business_logic/add_update_product_cubit.dart';
import 'package:ibn_sina_flutter/features/add_update_product/display/update_product_params.dart';
import 'package:ibn_sina_flutter/features/app/business_logic/app_cubit.dart';
import 'package:ibn_sina_flutter/features/authentication/registration/business_logic/registration_cubit.dart';
import 'package:ibn_sina_flutter/features/delivery/business_logic/delivery_cubit.dart';
import 'package:ibn_sina_flutter/features/home/business_logic/home_cubit.dart';
import 'package:ibn_sina_flutter/features/home/display/home_category_display.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/drawer/sina_drawer_cubit.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/student_equipments/student_equipments_cubit.dart';
import 'package:ibn_sina_flutter/features/notifications/business_logic/notification_cubit.dart';
import 'package:ibn_sina_flutter/features/order/add_order/business_logic/create_order_cubit.dart';
import 'package:ibn_sina_flutter/features/order/get_order/business_logic/orders_cubit.dart';
import 'package:ibn_sina_flutter/features/order/order_details/business_logic/order_details_cubit.dart';
import 'package:ibn_sina_flutter/features/products/business_logic/products_cubit.dart';

var getIt = GetIt.I;

void registerDependencies(GetIt diInjector) async {
  /// ********* Common **********
  getIt.registerSingleton(AppCubit(diInjector(), diInjector(), diInjector()));

  /// ********* Authentication **********
  getIt.registerFactory(() => RegistrationCubit(diInjector()));

  /// ********* Notification **********
  getIt.registerFactory(() => NotificationCubit(diInjector()));

  /// ********* Home **********
  getIt.registerLazySingleton(() => HomeCubit());
  getIt.registerFactoryParam(
      (p1, _) => StudentEquipmentsCubit(p1 as HomeCategoryDisplay));
  getIt.registerFactory(
      () => SinaDrawerCubit(diInjector(), diInjector(), diInjector()));

  /// ********* Products **********
  getIt.registerFactoryParam(
      (p1, _) => ProductsCubit(diInjector(), diInjector()));
  getIt.registerFactoryParam((p1, _) => AddUpdateProductCubit(
        p1 as UpdateProductParams,
        diInjector(),
      ));

  /// ********* Delivery Fees **********
  getIt.registerFactory(() => DeliveryCubit(diInjector(), diInjector()));

  /// ********* Orders **********
  getIt.registerFactory(() => OrdersCubit(diInjector()));
  getIt.registerFactory(() => CreateOrderCubit(diInjector(), diInjector()));

  getIt.registerCachedFactoryParam((p1, _) => OrderDetailsCubit(
        p1 as OrderEntity,
        diInjector(),
        diInjector(),
        diInjector(),
  ));
}
