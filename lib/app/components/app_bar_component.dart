import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/image.png'),
          fit: BoxFit.cover,
        ),
          ),
        ),
      ),
      title: const Text(
        "Homeie",
        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: [
        const Text("Customer Name", style: TextStyle(color: Colors.black, fontSize: 16)),
        const SizedBox(width: 10),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/image.png'),
          radius: 16,
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
