import 'package:edge_project/app/components/category_component.dart';
import 'package:edge_project/app/components/bottom_nav_bar_component.dart';
import 'package:edge_project/app/modules/all_carts/views/all_carts_view.dart';
import 'package:edge_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:edge_project/app/components/popular_products_component.dart'; // add this import

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:edge_project/app/modules/all_products/views/all_products_view.dart';
final dummyProducts = [
  Product(image: 'assets/images/nikeshoe.png', title: 'Green Nike Air', price: 2499, rating: 4.2),
  Product(image: 'assets/images/nikeshoe.png', title: 'Green Nike Air', price: 2499, rating: 4.2),
  Product(image: 'assets/images/nikeshoe.png', title: 'Green Nike Air', price: 2499, rating: 4.2),
  Product(image: 'assets/images/nikeshoe.png', title: 'Green Nike Air', price: 2499, rating: 4.2),
  Product(image: 'assets/images/nikeshoe.png', title: 'Green Nike Air', price: 2499, rating: 4.2),
  Product(image: 'assets/images/nikeshoe.png', title: 'Green Nike Air', price: 2499, rating: 4.2),
  Product(image: 'assets/images/nikeshoe.png', title: 'Green Nike Air', price: 2499, rating: 4.2),
  Product(image: 'assets/images/nikeshoe.png', title: 'Green Nike Air', price: 2499, rating: 4.2),
  Product(image: 'assets/images/nikeshoe.png', title: 'Green Nike Air', price: 2499, rating: 4.2),
  Product(image: 'assets/images/nikeshoe.png', title: 'Green Nike Air', price: 2499, rating: 4.2),
  Product(image: 'assets/images/nikeshoe.png', title: 'Green Nike Air', price: 2499, rating: 4.2),
  // Product(image: '../')
];
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('HomeView'),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.cyan.shade400),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/head.png'),
                        radius: 30,
                      ),
                      SizedBox(height: 10),
                      Text("Sanzid Islam Mahi",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
                const ListTile(title: Text('Home')),
                const ListTile(title: Text('Orders')),
                ListTile(
                  title: const Text('Notifications'),
                  onTap: () {
                    Get.toNamed(Routes.NOTIFICATIONS);
                  },
                ),
                ListTile(
                  title: const Text('Cart'),
                  onTap: () {
                    Get.toNamed(Routes.ALL_CARTS);
                  },
                ),
                ListTile(
                  title: const Text('All Products'),
                  onTap: () {
                    Get.toNamed(Routes.ALL_PRODUCTS);
                  },
                ),
                ListTile(
                  title: const Text('Product Reviews'),
                  onTap: () {
                    Get.toNamed(Routes.CART_VIEW);
                  },
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children:  [
                SizedBox(height: 10),
                CategoryComponent(),
                SizedBox(height: 10),
                PopularProductsComponent(products: dummyProducts), // <--- 
              ],
            ),
          ),
          bottomNavigationBar: BottomNavBarComponent(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab,
          ),
        ));
  }
}
