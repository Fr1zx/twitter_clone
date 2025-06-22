import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final String label;
  final Function onTap;
  final double height;
  final double radius;
  final double margin;
  final Color? color;
  final bool isLoading;
  const DefaultButton({
    super.key,
    required this.label,
    required this.onTap,
    this.height = 45,
    this.radius = 5,
    this.margin = 30,
    this.color,
    this.isLoading = false,
  });

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return widget.isLoading
        ? Align(alignment: Alignment.center, child: CircularProgressIndicator())
        : Container(
          width: double.infinity,
          height: widget.height,
          margin: EdgeInsets.symmetric(horizontal: widget.margin),
          child: ElevatedButton(
            onPressed: () => widget.onTap(),
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.color ?? theme.colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.radius),
              ),
            ),
            child: Text(
              widget.label,
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onSecondary,
              ),
            ),
          ),
        );
  }
}
