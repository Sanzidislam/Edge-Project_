import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:edge_project/app/modules/catagory-products/controllers/catagory_products_controller.dart';
import 'package:edge_project/app/routes/app_pages.dart';

class CatagoryProductsView extends GetView<CatagoryProductsController> {
  const CatagoryProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.arguments.toString()} Products'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.productList.isEmpty) {
          return const Center(child: Text("No products found."));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.7, // adjust based on how tall you want the cards
          ),
          itemCount: controller.productList.length,
          itemBuilder: (context, index) {
            final product = controller.productList[index];
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product);
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: product.image == null || product.image.isEmpty
                          ? Image.asset(
                              'assets/images/fallback.png',
                              // fit: BoxFit.cover,
                              fit: BoxFit.fitHeight,
                            )
                          : Image.network(
                              product.image,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/fallback.png',
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
