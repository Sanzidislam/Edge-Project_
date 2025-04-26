import 'package:edge_project/app/modules/all_carts/views/all_carts_view.dart';
import 'package:edge_project/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:edge_project/app/modules/all_products/views/all_products_view.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple.shade100),
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
            const ListTile(
              title: Text('Home'),
              // onTap: () => _onItemTapped(0),
            ),
            const ListTile(
              title: Text('Orders'),
              // onTap: () => _onItemTapped(1),
            ),
            const ListTile(
              title: Text('Notifications'),
              // onTap: () => _onItemTapped(2),
            ),
            ListTile(
              title: const Text('Cart'),
              onTap: () {
                // Get.to(AllCartsView());
                Get.toNamed(Routes.ALL_CARTS);
              },
              // onTap: () => _onItemTapped(2),
            ),
            ListTile(
              title: const Text('All Products'),
              onTap: () {
                Get.toNamed(Routes.ALL_PRODUCTS);
              },
              // onTap: () => _onItemTapped(2),
            ),
            ListTile(
              title: const Text('Product Reviews'),
              onTap: () {
                Get.to(Routes.CART_VIEW);
              },
              // onTap: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
body: Obx(() {
  final user = controller.user.value;

  if (user != null) {
    return Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Welcome, ${user.email}',
        style: const TextStyle(fontSize: 24),
      ),
      const SizedBox(height: 20),
      Text(
        'User ID: ${user.uid}',
        style: const TextStyle(fontSize: 18),
      ),
      const SizedBox(height: 40),
      ElevatedButton(
        onPressed: () async {
          await controller.logout();
        },
        child: const Text('Logout'),
      ),
    ],
  ),
);

  } else {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.LOGIN);
            },
            child: const Text('Login'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.REGISTER);
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}),


    );
  }
}
