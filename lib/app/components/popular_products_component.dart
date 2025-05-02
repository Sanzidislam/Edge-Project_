import 'package:flutter/material.dart';

class Product {
  final String image;
  final String title;
  final double price;
  final double rating;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
  });
}

class PopularProductsComponent extends StatelessWidget {
  final List<Product> products;
  final String heading;

  const PopularProductsComponent({
    Key? key,
    required this.products,
    this.heading = 'Popular products',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            heading,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // let outer scroll view handle scrolling
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // two items per row
            childAspectRatio: 0.7,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('৳${product.price.toStringAsFixed(0)}'),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange, size: 16),
                            Text(product.rating.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
