import 'package:flutter/material.dart';

class BottomNavBarComponent extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBarComponent({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.orange,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Order"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notification"),
      ],
    );
  }
}