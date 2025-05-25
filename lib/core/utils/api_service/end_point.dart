class EndPoint {
  static const String baseUrl = 'https://codingarabic.online/api/';

  // ========================== 🔥 Auth 🔥 ========================== //
  static const String login = 'login';
  static const String register = 'register';
  static const String logout = 'logout';

  // ========================== 🔥 Home 🔥 ========================== //
  static const String allProduct = 'products';
  static const String bestseller = 'products-bestseller';
  static const String NewArrivals = 'products-new-arrivals';
  static const String categories = 'categories';

  static String categoryDetails(int id) => 'categories/$id';

  // ========================== 🔥 cart 🔥 ========================== //

  static const String Showcart = 'cart';
  static const String addCart = 'add-to-cart';
  static const String removeCart = 'remove-from-cart';
  static const String checkout = 'checkout';

  // ========================== 🔥 profile 🔥 ========================== //
  static const String profile = 'profile';
  static const String updateProfile = 'update-profile';
  static const String deleteProfile = 'delete-profile';
  // ========================== 🔥 wishlist 🔥 ==========================
  static const String wishlist ='wishlist';
  static const String removefromwishlist ='remove-from-wishlist';
  static const String addtowishlist ='add-to-wishlist';

}
