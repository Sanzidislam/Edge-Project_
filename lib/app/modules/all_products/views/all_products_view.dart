import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/all_products_controller.dart';

class AllProductsView extends GetView<AllProductsController> {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.productList.isEmpty) {
          return const Center(child: Text("No products found."));
        }

        return ListView.builder(
          itemCount: controller.productList.length,
          itemBuilder: (context, index) {
            final product = controller.productList[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: product.image == null || product.image.isEmpty
                    ? Image.asset(
                        'assets/images/fallback.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        product.image,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/fallback.png',
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                title: Text(product.title),
                subtitle: Text('\$${product.price}'),
              ),
            );
          },
        );
      }),
    );
  }
}
