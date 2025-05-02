import 'package:get/get.dart';

import '../modules/all_carts/bindings/all_carts_binding.dart';
import '../modules/all_carts/views/all_carts_view.dart';
import '../modules/all_products/bindings/all_products_binding.dart';
import '../modules/all_products/views/all_products_view.dart';
import '../modules/cart_view/bindings/cart_view_binding.dart';
import '../modules/cart_view/views/cart_view_view.dart';
import '../modules/catagory-products/bindings/catagory_products_binding.dart';
import '../modules/catagory-products/views/catagory_products_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/landing_page/bindings/landing_page_binding.dart';
import '../modules/landing_page/views/landing_page_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  static const INITIAL = Routes.LANDING_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PRODUCTS,
      page: () => const AllProductsView(),
      binding: AllProductsBinding(),
    ),
    GetPage(
      name: _Paths.ALL_CARTS,
      page: () => const AllCartsView(),
      binding: AllCartsBinding(),
    ),
    GetPage(
      name: _Paths.CART_VIEW,
      page: () => const CartViewView(),
      binding: CartViewBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.LANDING_PAGE,
      page: () => const LandingPageView(),
      binding: LandingPageBinding(),
    ),
    GetPage(
      name: _Paths.CATAGORY_PRODUCTS,
      page: () => const CatagoryProductsView(),
      binding: CatagoryProductsBinding(),
    ),
  ];
}
