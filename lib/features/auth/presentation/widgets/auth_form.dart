import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hint;
  final bool isPassword;

  const AuthForm({
    super.key,
    required this.textEditingController,
    required this.hint,
    required this.isPassword,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool isVisibitly = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        style: theme.textTheme.bodyMedium,
        controller: widget.textEditingController,
        obscureText: widget.isPassword ? !isVisibitly : false,
        decoration: InputDecoration(
          filled: true,
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: theme.hintColor.withOpacity(0.4),
            fontSize: 16,
          ),
          fillColor: theme.hintColor.withOpacity(0.06),

          suffixIcon:
              widget.isPassword
                  ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisibitly = !isVisibitly;
                        });
                      },
                      icon:
                          isVisibitly
                              ? Icon(
                                Icons.visibility,
                                color: theme.iconTheme.color,
                              )
                              : Icon(
                                Icons.visibility_off,
                                color: theme.iconTheme.color,
                              ),
                    ),
                  )
                  : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hoverColor: Colors.transparent,
        ),
      ),
    );
  }
}
