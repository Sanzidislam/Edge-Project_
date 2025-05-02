import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passtextEditingController = TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailtextEditingController.dispose();
    passtextEditingController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

Future<void> mRegister({required String email, required String pass}) async {
  try {
    await _auth.createUserWithEmailAndPassword(email: email, password: pass);

    Get.snackbar(
      "Success",
      "Account created successfully",
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
    );

    // Wait for the snackbar to show for a bit, then navigate
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed('/home'); // Navigate to Home page
    });
    
  } catch (e) {
    Get.snackbar(
      "Error",
      e.toString(),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
  }
}

}
