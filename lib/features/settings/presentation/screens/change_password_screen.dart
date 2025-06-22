import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frizter/app/routes/route_cubit.dart';
import 'package:frizter/core/widgets/default_button.dart';
import 'package:frizter/core/widgets/error_dialog.dart';
import 'package:frizter/features/settings/presentation/blocs/profile/profile_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocListener<ProfileBloc, ProfileState>(
        listenWhen:
            (previous, current) => context.read<RouteCubit>().isCurrentRoute(
              route: "/settings/changePassword",
            ),
        listener: (context, state) {
          state.maybeWhen(
            loaded: (user) {
              context.pop();
              context.push("/settings/changePassword/passwordChanged");
            },
            failure: (error, user) {
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
                "Update Your Password",
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 5),
              Text(
                "We will send you a confirmation email to change your password to your email address",
              ),
              const SizedBox(height: 50),
              Text("New Password"),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "password12345",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: theme.hintColor.withOpacity(0.4),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              BlocSelector<ProfileBloc, ProfileState, bool>(
                selector: (state) {
                  return state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );
                },
                builder: (context, state) {
                  return DefaultButton(
                    isLoading: state,
                    label: "Change",
                    onTap: () {
                      if (_passwordController.text.isNotEmpty) {
                        context.read<ProfileBloc>().add(
                          ProfileEvent.changePassword(_passwordController.text),
                        );
                      } else {
                        ErrorDialog.showErrorDialog(
                          context: context,
                          error: "Not all fields are filled",
                        );
                      }
                    },
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
