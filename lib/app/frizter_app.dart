import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frizter/app/di/di_container.dart';
import 'package:frizter/app/routes/app_routes.dart';
import 'package:frizter/app/routes/route_cubit.dart';
import 'package:frizter/app/theme/app_theme.dart';
import 'package:frizter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:frizter/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:frizter/features/search/presentation/bloc/search_bloc.dart';
import 'package:frizter/features/settings/presentation/blocs/profile/profile_bloc.dart';
import 'package:frizter/features/settings/presentation/blocs/settings/settings_bloc.dart';

class FrizterApp extends StatelessWidget {
  const FrizterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RouteCubit()),

        BlocProvider(create: (context) => sl.get<AuthBloc>()),
        BlocProvider(
          create:
              (context) =>
                  sl.get<SettingsBloc>()..add(SettingsEvent.getSavedSettings()),
        ),
        BlocProvider(create: (context) => sl.get<ProfileBloc>()),
        BlocProvider(create: (context) => sl.get<PostsBloc>()),
        BlocProvider(create: (context) => sl.get<SearchBloc>()),
      ],
      child: BlocSelector<SettingsBloc, SettingsState, bool>(
        selector:
            (state) => state.when(
              initial: () => false,
              loaded: (settings) => settings.isDarkMode,
              failure: (error) => false,
            ),
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoutes.routes,
            theme: state ? AppTheme.darkTheme : AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
          );
        },
      ),
    );
  }
}
