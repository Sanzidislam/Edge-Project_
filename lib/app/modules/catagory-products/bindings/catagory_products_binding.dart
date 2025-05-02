import 'package:get/get.dart';

import '../controllers/catagory_products_controller.dart';

class CatagoryProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatagoryProductsController>(
      () => CatagoryProductsController(),
    );
  }
}
