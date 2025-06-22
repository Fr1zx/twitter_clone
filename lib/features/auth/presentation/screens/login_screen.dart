import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frizter/app/routes/route_cubit.dart';
import 'package:frizter/core/widgets/default_button.dart';
import 'package:frizter/core/widgets/error_dialog.dart';
import 'package:frizter/features/auth/domain/usecases/login_use_case.dart';
import 'package:frizter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:frizter/features/auth/presentation/widgets/auth_form.dart';
import 'package:frizter/features/auth/presentation/widgets/auth_redirect_row.dart';
import 'package:frizter/features/auth/presentation/widgets/forgot_password_link.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _login(BuildContext context) {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      context.read<AuthBloc>().add(
        AuthEvent.login(
          LoginParams(
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
        listenWhen:
            (previous, current) =>
                context.read<RouteCubit>().isCurrentRoute(route: "/login"),
        listener: (context, state) {
          state.maybeWhen(
            failure: (error) {
              ErrorDialog.showErrorDialog(context: context, error: error);
            },
            successfully:
                () =>
                    context.read<RouteCubit>().updateRoute("/posts"),
            orElse: () {},
          );
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/login_logo.png", height: 220),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {},
                  child: Text(
                    "Welcome Back!",
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(height: 20),

                AuthForm(
                  textEditingController: _emailController,
                  hint: "Email",
                  isPassword: false,
                ).animate().slideX(begin: -1),
                const SizedBox(height: 20),
                AuthForm(
                  textEditingController: _passwordController,
                  hint: "Password",
                  isPassword: true,
                ).animate().slideX(begin: 1),
                ForgotPasswordLink(),
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
                      label: "Login",
                      height: 48,
                      radius: 8,
                      color: theme.colorScheme.primary,
                      onTap: () => _login(context),
                    );
                  },
                ).animate().slideY(begin: 1).fadeIn(),

                const SizedBox(height: 40),
                AuthRedirectRow(
                  questionText: "Don't have an account?",
                  actionText: "Register now!",
                  onActionTap: () {
                    context.read<RouteCubit>().updateRoute("/register");
                    context.push("/register");
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
