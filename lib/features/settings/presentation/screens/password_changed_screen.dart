import 'package:flutter/material.dart';
import 'package:frizter/core/widgets/default_button.dart';
import 'package:go_router/go_router.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/password.png", height: 100),
            const SizedBox(height: 10),
            Text("Password changed!", style: theme.textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              "The password has been successfully changed to a new one",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            DefaultButton(
              label: "To Settings Screen",
              onTap: () => context.go("/settings"),
            ),
          ],
        ),
      ),
    );
  }
}
