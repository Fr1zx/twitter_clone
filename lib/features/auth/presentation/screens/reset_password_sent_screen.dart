import 'package:flutter/material.dart';
import 'package:frizter/core/widgets/default_button.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordSentScreen extends StatelessWidget {
  const ResetPasswordSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/email.png", height: 100),
            const SizedBox(height: 10),
            Text("Check your email", style: theme.textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              "We have sent a password change\nemail to your email address",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            DefaultButton(label: "To Login Screen", onTap: () => context.go("/login")),
          ],
        ),
      ),
    );
  }
}
