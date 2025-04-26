import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_view_controller.dart';

class CartViewView extends GetView<CartViewController> {
  const CartViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CartViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
