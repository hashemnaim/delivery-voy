class Constants {
  /// Base Url
  static const baseUrl = 'https://foamklean.com';
  static const mainUrl = baseUrl + '/api/';

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
  static const deliveryOrdersUrl = mainUrl + 'delivery-orders';
  static const homeOrdersUrl = mainUrl + 'home-services-delivery-orders';
  static const changeStatusOrder = mainUrl + 'change-order-status';
}

// Form Error

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
