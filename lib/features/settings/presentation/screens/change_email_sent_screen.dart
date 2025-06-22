import 'package:flutter/material.dart';
import 'package:frizter/core/widgets/default_button.dart';
import 'package:go_router/go_router.dart';

class ChangeEmailSentScreen extends StatelessWidget {
  const ChangeEmailSentScreen({super.key});

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
            Text("Check your new email", style: theme.textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              "We sent a confirmation about changing the email to a new email, confirm it to change the email",
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
