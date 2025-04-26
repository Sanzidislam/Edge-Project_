import 'package:get/get.dart';

import '../controllers/cart_view_controller.dart';

class CartViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartViewController>(
      () => CartViewController(),
    );
  }
}
