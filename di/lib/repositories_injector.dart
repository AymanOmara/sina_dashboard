import 'package:data/features/authentication/repositories/auth_repository.dart';
import 'package:data/features/cart/repository/cart_repository.dart';
import 'package:data/features/favorites/repository/favorites_repository.dart';
import 'package:data/features/home/repository/home_repository.dart';
import 'package:data/features/notification/repository/notifications_repository.dart';
import 'package:data/features/order/repository/order_repository.dart';
import 'package:data/features/products/repository/products_repository.dart';
import 'package:domain/features/authentication/repositories/i_auth_repository.dart';
import 'package:domain/features/cart/repository/i_cart_repository.dart';
import 'package:domain/features/favorites/repository/i_favorites_repository.dart';
import 'package:domain/features/home/repository/i_home_repository.dart';
import 'package:domain/features/notifications/repository/i_notifications_repository.dart';
import 'package:domain/features/order/repository/i_order_repository.dart';
import 'package:domain/features/products/repository/i_products_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> setupRepositoryInjector(GetIt diInjector) async {
  /// ********* Auth **********
  diInjector.registerSingleton<IAuthRepository>(AuthRepository(diInjector(),diInjector()));
  
  /// ********* Home **********
   diInjector.registerSingleton<IHomeRepository>(HomeRepository(diInjector()));

   /// ********* Products **********
   diInjector.registerSingleton<IProductsRepository>(ProductsRepository(diInjector()));
   diInjector.registerSingleton<ICartRepository>(CartRepository());

   /// ********* Notifications **********
   diInjector.registerSingleton<INotificationsRepository>(NotificationsRepository(diInjector(),diInjector()));

   /// ********* Order **********
   diInjector.registerSingleton<IOrderRepository>(OrderRepository(diInjector(),diInjector()));

   /// ********* Favorites **********
   diInjector.registerSingleton<IFavoritesRepository>(FavoritesRepository(diInjector(),diInjector()));

}