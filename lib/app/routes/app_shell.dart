import 'package:flutter/material.dart';
import 'package:frizter/core/widgets/bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  final StatefulNavigationShell shell;
  const AppShell({super.key, required this.shell});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: BottomNavBar(
        onTap: (index) => shell.goBranch(index),
        currentIndex: shell.currentIndex,
      ),
    );
  }
}
