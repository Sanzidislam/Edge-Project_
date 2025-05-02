import 'package:edge_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = ["electronics","jewelery","men's clothing","women's clothing"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        // const Text("   Category", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("   Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {
                print("See all categories clicked");
              },
              child: const Text("See all", style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(categories.length, (index) {
              return GestureDetector(
                onTap: () {
                  print("${categories[index]} category clicked");
                  // go catagory_products_view
                  Get.toNamed(Routes.CATAGORY_PRODUCTS, arguments: categories[index]);
                },
                child: Container(
                  width: 100,
                  height: 80,
                  // space between the categories
                  margin: const EdgeInsets.all(10),
                  // margin: const ,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(categories[index], textAlign: TextAlign.center),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
