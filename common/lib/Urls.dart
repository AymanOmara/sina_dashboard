class Urls {
  Urls._();
  static const baseUrl = "http://10.0.2.2:5029/api/";
  static const banner = "Panner/GetPanner";

  static const products = "Product/GetProduct/";

  static const login = "User/Login";
  static const deleteAccount = "User/DeleteAccount/";
  static const createAccount = "User/CreateAccount";

  static const notifications = "Notifications/GetNotifications/";
  static const createOrder = "Order/MakeOrder";
  static const myOrders = "Order/GetOrders/";
  static const favorites = "Product/GetAllFavorites";

  static String addToFavorites = "Product/AddFavorite";
  static String removeFromFavorites = "Product/DeleteFavorite";
  static String registerFcmToken = "Notifications/RegisterFCMToken";

}
