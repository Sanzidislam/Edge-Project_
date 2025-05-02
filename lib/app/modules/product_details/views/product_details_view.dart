import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments;

    final RxInt quantity = 1.obs; // ✅ FIXED

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Product Image
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Image.network(
                      product.image,
                      height: 250,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/fallback.png',
                          height: 250,
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),

                  // Product Info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Rating Row
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              "4.3 (134)", // static for now
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Price Section
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.yellow[700],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                "25%",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "\$${(product.price + 15).toStringAsFixed(1)}", // Old Price
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "\$${product.price.toStringAsFixed(1)}", // New Price
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Product Title
                        Text(
                          product.title,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),

                        // Stock Status
                        Row(
                          children: [
                            const Text(
                              "Status : ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "In Stock",
                              style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Description
                        const Text(
                          "Description",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.description ?? "No description available.",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            // maybe navigate to full description page later
                          },
                          child: const Text(
                            "Show more",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Quantity + Add to Cart
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFF9F9F9),
            ),
            child: Row(
              children: [
                // Quantity control
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (quantity > 1) quantity.value--;
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Obx(() => Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 18),
                    )),
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: () {
                        quantity.value++;
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                // Add to cart button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Add to cart action
                  },
                  // color white

                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
