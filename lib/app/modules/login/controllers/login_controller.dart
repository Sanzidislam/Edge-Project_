import 'package:edge_project/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // login stuff with firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passtextEditingController = TextEditingController();

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
    super.onClose();
  }


Future<bool> mLogin({required String email, required String pass}) async {
  try {
    UserCredential response = await _auth.signInWithEmailAndPassword(
      // email: email,
      // password: pass,
      email: 'sanzid@gmail.com',
      password: '123456',
    );

    // Optional: log or print
    print(response);

    return true; // ✅ Login succeeded
  } catch (e, stackTrace) {
    print(stackTrace); // Optional debug log
    Get.snackbar(
      "Login Failed",
      e.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    return false; // ❌ Login failed
  }
}


  //logout
  void logout() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
