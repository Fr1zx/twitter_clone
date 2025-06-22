import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorDialog {
  static Future<void> showErrorDialog({
    required BuildContext context,
    required String error,
  }) {
    return showDialog(
      context: context,
      builder: (context) => _ErrorDialogWidget(error: error),
    );
  }
}

class _ErrorDialogWidget extends StatelessWidget {
  final String error;

  const _ErrorDialogWidget({required this.error});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/error.png", height: 50),
          const SizedBox(height: 20),
          Text("Error", style: theme.textTheme.headlineSmall),
          const SizedBox(height: 10),
          Text(error, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          SizedBox(
            width: 100,
            height: 36,
            child: ElevatedButton(
              onPressed: () => context.pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Ok",
                style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: 15,
                  color: theme.colorScheme.onSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
