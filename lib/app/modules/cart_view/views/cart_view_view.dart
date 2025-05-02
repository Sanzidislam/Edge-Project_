import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_view_controller.dart';

class CartViewView extends GetView<CartViewController> {
  const CartViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart ID: ${controller.cart.id}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User ID: ${controller.cart.userId}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("Date: ${controller.cart.date ?? 'N/A'}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text("Products:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: controller.cart.products.length,
                itemBuilder: (context, index) {
                  final product = controller.cart.products[index];
                  return ListTile(
                    leading: const Icon(Icons.shopping_bag),
                    title: Text("Product ID: ${product.productId}"),
                    subtitle: Text("Quantity: ${product.quantity}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
