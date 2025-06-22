import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frizter/app/routes/route_cubit.dart';
import 'package:frizter/core/widgets/error_dialog.dart';
import 'package:frizter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:frizter/features/settings/domain/usecases/update_profile_use_case.dart';
import 'package:frizter/features/settings/presentation/blocs/profile/profile_bloc.dart';
import 'package:frizter/features/settings/presentation/blocs/settings/settings_bloc.dart';
import 'package:frizter/features/settings/presentation/widgets/settings_card.dart';
import 'package:frizter/features/settings/presentation/widgets/settings_switcher_card.dart';
import 'package:frizter/features/settings/presentation/widgets/user_edit_info_bottom_sheet.dart';
import 'package:frizter/features/settings/presentation/widgets/user_info_card.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _usernameContoller = TextEditingController();
  final TextEditingController _bioContoller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileBloc>().add(ProfileEvent.loadUser());
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();
    final settingsBloc = context.read<SettingsBloc>();

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (user) {
                _usernameContoller.text = user.username;
                _bioContoller.text = user.bio;
              },
              failure: (error, user) {
                ErrorDialog.showErrorDialog(context: context, error: error);
              },
              orElse: () {},
            );
          },
          child: Column(
            children: [
              const SizedBox(height: 20),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return state.when(
                    initial: () {
                      return Lottie.asset(
                        "assets/anims/loading.json",
                        height: 300,
                      );
                    },
                    loading: () {
                      return Lottie.asset(
                        "assets/anims/loading.json",
                        height: 300,
                      );
                    },
                    loaded: (user) {
                      return UserInfoCard(
                        userModel: user,
                        onEdit:
                            () => showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return UserEditInfoBottomSheet(
                                  usernameContoller: _usernameContoller,
                                  bioContoller: _bioContoller,
                                  userModel: user,
                                  onSave:
                                      (img) => profileBloc.add(
                                        ProfileEvent.updateProfile(
                                          UpdateProfileParams(
                                            username: _usernameContoller.text,
                                            bio: _bioContoller.text,
                                            newPhoto: img,
                                          ),
                                        ),
                                      ),
                                );
                              },
                            ),
                        onLogout: () => context.read<AuthBloc>().add(AuthEvent.logout()),
                      );
                    },
                    failure: (error, user) {
                      if (user != null) {
                        return UserInfoCard(
                          userModel: user,
                          onEdit:
                              () => showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return UserEditInfoBottomSheet(
                                    usernameContoller: _usernameContoller,
                                    bioContoller: _bioContoller,
                                    userModel: user,
                                    onSave:
                                        (img) => profileBloc.add(
                                          ProfileEvent.updateProfile(
                                            UpdateProfileParams(
                                              username: _usernameContoller.text,
                                              bio: _bioContoller.text,
                                              newPhoto: img,
                                            ),
                                          ),
                                        ),
                                  );
                                },
                              ),
                          onLogout:
                              () => context.read<AuthBloc>().add(AuthEvent.logout()),
                        );
                      }
                      return Text(error);
                    },
                  );
                },
              ),
              const SizedBox(height: 50),
              BlocSelector<SettingsBloc, SettingsState, bool>(
                selector: (state) {
                  return state.when(
                    initial: () => false,
                    loaded: (settings) => settings.isDarkMode,
                    failure: (error) => false,
                  );
                },
                builder: (context, state) {
                  return SettingsSwitcherCard(
                    title: "Dark theme",
                    value: state,
                    onSwitch:
                        () => settingsBloc.add(SettingsEvent.changeTheme()),
                  );
                },
              ),
              const SizedBox(height: 15),
              BlocSelector<SettingsBloc, SettingsState, bool>(
                selector: (state) {
                  return state.when(
                    initial: () => true,
                    loaded: (settings) => settings.isNotificationsAllowed,
                    failure: (error) => true,
                  );
                },
                builder: (context, state) {
                  return SettingsSwitcherCard(
                    title: "Notifications",
                    value: state,
                    onSwitch:
                        () => settingsBloc.add(
                          SettingsEvent.changeNotifications(),
                        ),
                  );
                },
              ),
              const SizedBox(height: 15),
              SettingsCard(
                title: "Change Email",
                onTap: () {
                  context.push("/settings/changeEmail");
                  context.read<RouteCubit>().updateRoute(
                    "/settings/changeEmail",
                  );
                },
              ),
              const SizedBox(height: 15),
              SettingsCard(
                title: "Change Password",
                onTap: () {
                  context.read<RouteCubit>().updateRoute(
                    "/settings/changeEmail",
                  );
                  context.push("/settings/changePassword");
                },
              ),
              const SizedBox(height: 15),
              SettingsCard(
                title: "Contact Support",
                onTap: () {
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: 'frzx403@gmil.com',
                    queryParameters: {
                      'subject': 'i have a quastion',
                      'body': 'Hello, i have a quastion...',
                    },
                  );
                  launchUrl(emailUri);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Frizter 1.0",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w200,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
