import 'package:edge_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/all_carts_controller.dart';

class AllCartsView extends GetView<AllCartsController> {
  const AllCartsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Carts'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.cartList.isEmpty) {
          return const Center(child: Text("No products found."));
        }

        return ListView.builder(
          itemCount: controller.cartList.length,
          itemBuilder: (context, index) {
            final product = controller.cartList[index];
            // return only a box
            return Card(
              // child: ListTile(
              //   // on click cart details
              //   onTap: () {
              //     Get.toNamed("/cart-view");
              //   },
              //   // cart icon
              //   leading: const Icon(Icons.shopping_cart),
              //   title: Text("Cart ID : ${product.id}"),
              //   subtitle: Text("User ID : ${product.userId}"),
              // ),
              child: InkWell(
                onTap: () {
                  // Get.toNamed("/cart-view", arguments: product);
                  Get.toNamed(Routes.CART_VIEW, arguments: product);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cart ID : ${product.id}"),
                      Text("User ID : ${product.userId}"),
                      const SizedBox(height: 8),
                      const Text("Products :"),
                      ...product.products.map((e) => Text("Product ID : ${e.productId}")),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
