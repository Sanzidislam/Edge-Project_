import 'dart:convert';

import 'package:get/get.dart';
import 'package:edge_project/app/data/models/cart_model.dart';
import 'package:http/http.dart' as http;
class AllCartsController extends GetxController {
  //TODO: Implement AllCartsController
  var isLoading = true.obs;
  var cartList = <CartModel>[].obs;
  final allCartsUrl = "https://fakestoreapi.com/carts?userId=1";
  @override
  void onInit(){
    fetchCarts();
    super.onInit();
  }

  void fetchCarts() async{
    try{
      isLoading.value = true;

      var response = await http.get(Uri.parse(allCartsUrl));

      print(response.body);

      if(response.statusCode == 200){
        List<dynamic> carts = json.decode(response.body);

        for(var i = 0; i < carts.length; i++){
          CartModel cartModelObject = CartModel.fromJson(carts[i]);
          cartList.add(cartModelObject);
        }

        // // print the cart
        // for(var i = 0; i < cartList.length; i++){
        //   print(cartList[i].toString());
        // }
      }else{
        Get.snackbar("Error", "Failed to fetch carts");
      }
    }catch(e){
      Get.snackbar("Error", e.toString());
    }finally{
      isLoading.value = false;
    }
  }
  final count = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
