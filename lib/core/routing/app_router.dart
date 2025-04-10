import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/di/injector.dart';
import 'package:ibn_sina_flutter/core/routing/app_routes.dart';
import 'package:ibn_sina_flutter/features/add_update_product/business_logic/add_update_product_cubit.dart';
import 'package:ibn_sina_flutter/features/add_update_product/display/update_product_params.dart';
import 'package:ibn_sina_flutter/features/add_update_product/presentation/add_update_product_screen.dart';
import 'package:ibn_sina_flutter/features/authentication/login/business_logic/login_cubit.dart';
import 'package:ibn_sina_flutter/features/authentication/login/presentation/page/login_screen.dart';
import 'package:ibn_sina_flutter/features/authentication/registration/business_logic/registration_cubit.dart';
import 'package:ibn_sina_flutter/features/authentication/registration/presentation/page/registration_screen.dart';
import 'package:ibn_sina_flutter/features/home/business_logic/home_cubit.dart';
import 'package:ibn_sina_flutter/features/home/display/home_category_display.dart';
import 'package:ibn_sina_flutter/features/home/display/i_user_logged_in_state.dart';
import 'package:ibn_sina_flutter/features/home/presentation/page/home_screen.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/student_equipments/student_equipments_cubit.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/student_equipments/student_equipments_widget.dart';
import 'package:ibn_sina_flutter/features/notifications/business_logic/notification_cubit.dart';
import 'package:ibn_sina_flutter/features/notifications/presentation/page/notifications_screen.dart';
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
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<LoginCubit>(
              param1: settings.arguments as IUserLoggedInState,
            ),
            child: LoginScreen(),
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

      // case AppRoutes.order:
      //   return DialogRoute(
      //     context: Get.context!,
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<SubmitOrderCubit>(
      //         param1: settings.arguments as ISuccessAble,
      //       ),
      //       child: SubmitOrderScreen(),
      //     ),
      //   );
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
      default:
        return null;
    }
  }
}
