import 'package:flutter/material.dart';

class AuthRedirectRow extends StatelessWidget {
  final String questionText;
  final String actionText;
  final VoidCallback onActionTap;

  const AuthRedirectRow({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(questionText),
        const SizedBox(width: 5),
        InkWell(
          onTap: onActionTap,
          child: Text(
            actionText,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
