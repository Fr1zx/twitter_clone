import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 45, top: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () => context.push("/passwordReset"),
          child: Text(
            "Forgot your password?",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
