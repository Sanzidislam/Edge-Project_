import 'package:get/get.dart';
import 'package:edge_project/app/data/models/cart_model.dart';

class CartViewController extends GetxController {
  late CartModel cart; // Receive CartModel from arguments

  @override
  void onInit() {
    super.onInit();
    cart = Get.arguments as CartModel; // get passed cart
  }
}

