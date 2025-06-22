import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frizter/core/widgets/default_button.dart';
import 'package:frizter/core/widgets/error_dialog.dart';
import 'package:frizter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            successfully: () {
              context.push("/passwordResetSent");
            },
            failure: (error) {
              ErrorDialog.showErrorDialog(context: context, error: error);
            },
            orElse: () {},
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => context.pop(),
                child: Icon(Icons.arrow_back),
              ),

              const SizedBox(height: 15),
              Text(
                "Reset Your Password",
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 5),
              Text(
                "We will send you a confirmation email to change your password to your email address",
              ),
              const SizedBox(height: 50),
              Text("Email address"),
              const SizedBox(height: 10),
              TextField(
                controller: _emailController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "email@gmail.com",
                  hintStyle: TextStyle(color: theme.hintColor.withOpacity(0.4)),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              BlocSelector<AuthBloc, AuthState, bool>(
                selector: (state) {
                  return state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );
                },
                builder: (context, state) {
                  return DefaultButton(
                    isLoading: state,
                    label: "Send",
                    onTap:
                        () => context.read<AuthBloc>().add(
                          AuthEvent.resetPassword(_emailController.text),
                        ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
