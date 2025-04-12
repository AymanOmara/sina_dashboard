class Urls {
  Urls._();

  static const baseUrl = "http://localhost:5029/api/";
  static const banner = "Panner/GetPanner";

  static const products = "/Product";
  static const addProduct = "Product/AddProduct";
  static const updateProduct = "Product/UpdateProduct/";
  static const deleteProduct = "Product/DeleteProduct/";

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

  static String getAllOrders = "Order/GetAllOrders";

  static String fetchDeliveryFees = "Delivery/GetDeliveryFees";

  static String updateDeliveryFees = "Delivery/UpdateDeliveryFees";
  static String getOrderProducts = "Order/GetOrderProducts/";
  static String updateOrder = "Order/EditOrder/";
}
