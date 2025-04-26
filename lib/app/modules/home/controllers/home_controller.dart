import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    user.value = FirebaseAuth.instance.currentUser;

    // Listen to changes
    FirebaseAuth.instance.authStateChanges().listen((event) {
      user.value = event;
    });
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.snackbar("Logged out", "You have been logged out",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Colors.white);
  }
}
