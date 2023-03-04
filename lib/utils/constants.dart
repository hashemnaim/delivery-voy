class Constants {
  static const String apiKey = "AIzaSyBXe1l4YeBc_V1tICxmDpFoHRW0h-GYqOs";

  /// Base Url
  static const baseUrl = 'https://voy-sa.com';
  static const mainUrl = baseUrl + '/admin/api/';

  /// Home
  static const settingsUrl = mainUrl + 'settings';

  ///Product
  static const categoryUrl = mainUrl + 'category-products';
  static const subCategoryUrl = mainUrl + 'sub-category';
  static const detailsCategoryUrl = mainUrl + 'category-details';

  /// Auth
  static const loginUrl = mainUrl + 'login';
  static const changePasswordUrl = mainUrl + 'change-password';
  static const forgetPasswordUrl = mainUrl + 'forget-password';

  /// Profile
  static const updateProfileUrl = mainUrl + 'update-user-data';
  static const profileUrl = mainUrl + 'user-data';

  /// Order
  static const addOrderItemsOrder = mainUrl + 'add-order-items';
  static const orderDetailsOrder = mainUrl + 'order-details';
  static const updateDetailsOrder = mainUrl + 'update-order-details';
  static const supplierOrdersUrl = mainUrl + 'supplier-orders';
  static const supplierdeliveryOrdersUrl = mainUrl + 'supplier-deliveries';
  static const addDeliveryOrderUrl = mainUrl + 'add-delivery-order';
  static const homeOrdersUrl = mainUrl + 'home-services-delivery-orders';
  static const changeStatusOrder = mainUrl + 'change-order-status';

  static const currency = 'ريال';
}

// Form Error

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
