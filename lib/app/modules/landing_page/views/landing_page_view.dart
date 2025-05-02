import 'package:flutter/material.dart';
import 'package:edge_project/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/landing_page_controller.dart';

class LandingPageView extends GetView<LandingPageController> {
  const LandingPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LandingPageView'),
        centerTitle: true,
      ),
      body: Obx(() {
        final user = controller.user.value;

        if (user != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcoe, ${user.email}',
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
