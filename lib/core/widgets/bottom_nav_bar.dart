import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int index) onTap;
  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),

      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => onTap(index),
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Posts"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
