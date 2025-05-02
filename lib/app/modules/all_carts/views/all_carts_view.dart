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
          return const Center(child: Text("No carts found."));
        }

        return ListView.builder(
          itemCount: controller.cartList.length,
          itemBuilder: (context, index) {
            final cart = controller.cartList[index];
            return Card(
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.CART_VIEW, arguments: cart);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cart ID: ${cart.id}", style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text("User ID: ${cart.userId}"),
                      Text("Date: ${cart.date ?? 'No date'}"),
                      // const SizedBox(height: 8),
                      // const Text("Products:"),
                      // ...cart.products.map((product) => Text("• Product ID: ${product.productId}, Quantity: ${product.quantity}")),
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

