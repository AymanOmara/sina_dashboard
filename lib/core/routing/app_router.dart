import 'package:domain/features/order/entity/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/di/injector.dart';
import 'package:ibn_sina_flutter/core/routing/app_routes.dart';
import 'package:ibn_sina_flutter/features/add_update_product/business_logic/add_update_product_cubit.dart';
import 'package:ibn_sina_flutter/features/add_update_product/display/update_product_params.dart';
import 'package:ibn_sina_flutter/features/add_update_product/presentation/add_update_product_screen.dart';

import 'package:ibn_sina_flutter/features/authentication/registration/business_logic/registration_cubit.dart';
import 'package:ibn_sina_flutter/features/authentication/registration/presentation/page/registration_screen.dart';
import 'package:ibn_sina_flutter/features/delivery/business_logic/delivery_cubit.dart';
import 'package:ibn_sina_flutter/features/delivery/presentation/page/delivery_fees_screen.dart';
import 'package:ibn_sina_flutter/features/home/business_logic/home_cubit.dart';
import 'package:ibn_sina_flutter/features/home/display/home_category_display.dart';
import 'package:ibn_sina_flutter/features/home/presentation/page/home_screen.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/student_equipments/student_equipments_cubit.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/student_equipments/student_equipments_widget.dart';
import 'package:ibn_sina_flutter/features/notifications/business_logic/notification_cubit.dart';
import 'package:ibn_sina_flutter/features/notifications/presentation/page/notifications_screen.dart';
import 'package:ibn_sina_flutter/features/order/add_order/business_logic/create_order_cubit.dart';
import 'package:ibn_sina_flutter/features/order/add_order/presentation/page/create_order_screen.dart';
import 'package:ibn_sina_flutter/features/order/get_order/business_logic/orders_cubit.dart';
import 'package:ibn_sina_flutter/features/order/get_order/presentation/page/orders_screen.dart';
import 'package:ibn_sina_flutter/features/order/order_details/business_logic/order_details_cubit.dart';
import 'package:ibn_sina_flutter/features/order/order_details/presentation/page/order_details_screen.dart';
import 'package:ibn_sina_flutter/features/products/business_logic/products_cubit.dart';
import 'package:ibn_sina_flutter/features/products/presentation/page/products_screen.dart';

class AppRouter {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: HomeScreen(),
          ),
        );

      case AppRoutes.products:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProductsCubit>(),
            child: ProductsScreen(),
          ),
        );
      case AppRoutes.addUpdateProduct:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AddUpdateProductCubit>(
              param1: settings.arguments as UpdateProductParams,
            ),
            child: AddUpdateProductScreen(),
          ),
        );
      case AppRoutes.registration:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<RegistrationCubit>(),
            child: RegistrationScreen(),
          ),
        );
      case AppRoutes.notifications:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<NotificationCubit>(),
            child: NotificationsScreen(),
          ),
        );
      case AppRoutes.order:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<OrdersCubit>(),
            child: OrdersScreen(),
          ),
        );
      case AppRoutes.createOrder:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<CreateOrderCubit>(),
            child: CreateOrderScreen(),
          ),
        );
      case AppRoutes.studentEquipments:
        return DialogRoute(
          context: Get.context!,
          builder: (_) => BlocProvider(
            create: (context) => getIt<StudentEquipmentsCubit>(
              param1: settings.arguments as HomeCategoryDisplay,
            ),
            child: StudentEquipmentsWidget(),
          ),
        );
      case AppRoutes.deliveryFees:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<DeliveryCubit>(),
            child: DeliveryFeesScreen(),
          ),
        );
      case AppRoutes.orderDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<OrderDetailsCubit>(
              param1: settings.arguments as OrderEntity,
            ),
            child: OrderDetailsScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
