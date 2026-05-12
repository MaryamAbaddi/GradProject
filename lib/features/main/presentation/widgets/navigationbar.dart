import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      onTap: onTap,
      elevation: 20,
      currentIndex: currentIndex,
      backgroundColor: Colors.black,
      selectedItemColor: colors.primary,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Community'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Purchases'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
      ],
    );
  }
}