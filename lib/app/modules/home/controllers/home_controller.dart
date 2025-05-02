import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  // var user = Rxn<User>();
  var categories = <String>[].obs;
    var currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // user.value = FirebaseAuth.instance.currentUser;

    // // Listen to changes
    // FirebaseAuth.instance.authStateChanges().listen((event) {
    //   user.value = event;
    // });
  }
  // fetch categories from https://fakestoreapi.com/products/categories

  void fetchCategories() async {
    try {
      var response = await http.get(Uri.parse("https://fakestoreapi.com/products/categories"));
      if (response.statusCode == 200) {
        List<String> categoriesList = List<String>.from(json.decode(response.body));
        categories.assignAll(categoriesList);
      } else {
        Get.snackbar("Error", "Failed to fetch categories");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.snackbar("Logged out", "You have been logged out",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Colors.white);
  }
    void changeTab(int index) {
    currentIndex.value = index;
  }
}
