import 'dart:convert';
import 'package:get/get.dart';
import 'package:edge_project/app/data/models/cart_model.dart';
import 'package:http/http.dart' as http;

class AllCartsController extends GetxController {
  var isLoading = true.obs;
  var cartList = <CartModel>[].obs;

  final allCartsUrl = "https://fakestoreapi.com/carts?userId=1";

  @override
  void onInit() {
    fetchCarts();
    super.onInit();
  }

  void fetchCarts() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(allCartsUrl));

      if (response.statusCode == 200) {
        List<dynamic> carts = json.decode(response.body);

        cartList.value = carts.map((cart) => CartModel.fromJson(cart)).toList();
      } else {
        Get.snackbar("Error", "Failed to fetch carts");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
