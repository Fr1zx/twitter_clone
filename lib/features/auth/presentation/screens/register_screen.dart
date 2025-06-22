import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frizter/app/routes/route_cubit.dart';
import 'package:frizter/core/widgets/default_button.dart';
import 'package:frizter/core/widgets/error_dialog.dart';
import 'package:frizter/features/auth/domain/usecases/register_use_case.dart';
import 'package:frizter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:frizter/features/auth/presentation/widgets/auth_form.dart';
import 'package:frizter/features/auth/presentation/widgets/auth_redirect_row.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _register(BuildContext context) {
    if (_usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      context.read<AuthBloc>().add(
        AuthEvent.register(
          RegisterParams(
            username: _usernameController.text,
            email: _emailController.text,
            password: _passwordController.text,
          ),
        ),
      );
    } else {
      ErrorDialog.showErrorDialog(
        context: context,
        error: "Not all fields are filled",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            failure: (error) {
              ErrorDialog.showErrorDialog(context: context, error: error);
            },
            successfully:
                () => context.read<RouteCubit>().updateRoute("/posts"),
            orElse: () {},
          );
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/register_logo.png", height: 220),
                const SizedBox(height: 20),
                Text(
                  "Create an account!",
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                AuthForm(
                  textEditingController: _usernameController,
                  hint: "Username",
                  isPassword: false,
                ).animate().slideX(begin: -1),
                const SizedBox(height: 20),
                AuthForm(
                  textEditingController: _emailController,
                  hint: "Email",
                  isPassword: false,
                ).animate().slideX(begin: 1),
                const SizedBox(height: 20),
                AuthForm(
                  textEditingController: _passwordController,
                  hint: "Password",
                  isPassword: true,
                ).animate().slideX(begin: -1),
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
                      label: "Register",
                      height: 48,
                      radius: 8,
                      color: theme.colorScheme.primary,
                      onTap: () => _register(context),
                    );
                  },
                ).animate().slideY(begin: 1).fadeIn(),
                const SizedBox(height: 40),
                AuthRedirectRow(
                  questionText: "Already have an account?",
                  actionText: "Login now!",
                  onActionTap: () {
                    context.read<RouteCubit>().updateRoute("/login");
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
