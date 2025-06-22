import 'package:flutter/material.dart';
import 'package:frizter/app/routes/app_shell.dart';
import 'package:frizter/app/routes/routes_refresh_stream.dart';
import 'package:frizter/app/di/di_container.dart';
import 'package:frizter/features/auth/presentation/screens/login_screen.dart';
import 'package:frizter/features/auth/presentation/screens/register_screen.dart';
import 'package:frizter/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:frizter/features/auth/presentation/screens/reset_password_sent_screen.dart';
import 'package:frizter/features/posts/presentation/screens/make_post_screen.dart';
import 'package:frizter/features/posts/presentation/screens/posts_screen.dart';
import 'package:frizter/features/search/presentation/screens/search_screen.dart';
import 'package:frizter/features/settings/presentation/screens/change_email_screen.dart';
import 'package:frizter/features/settings/presentation/screens/change_email_sent_screen.dart';
import 'package:frizter/features/settings/presentation/screens/change_password_screen.dart';
import 'package:frizter/features/settings/presentation/screens/password_changed_screen.dart';
import 'package:frizter/features/settings/presentation/screens/settings_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = GoRouter(
    observers: [RouteObserver()],
    initialLocation: "/login",
    refreshListenable: sl.get<RoutesRefreshStream>(),
    routes: [
      GoRoute(path: "/login", builder: (context, state) => LoginScreen()),
      GoRoute(path: "/register", builder: (context, state) => RegisterScreen()),
      GoRoute(
        path: "/passwordReset",
        builder: (context, state) => ResetPasswordScreen(),
      ),
      GoRoute(
        path: "/passwordResetSent",
        builder: (context, state) => ResetPasswordSentScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder:
            (context, state, navigationShell) =>
                AppShell(shell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/posts",
                builder: (context, state) => PostsScreen(),
                routes: [
                  GoRoute(
                    path: "/makePost",
                    builder: (context, state) => MakePostScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/search",
                builder: (context, state) => SearchScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/settings",
                builder: (context, state) => SettingsScreen(),
                routes: [
                  GoRoute(
                    path: "/changeEmail",
                    builder: (context, state) => ChangeEmailScreen(),
                    routes: [
                      GoRoute(
                        path: "/emailSent",
                        builder: (context, state) => ChangeEmailSentScreen(),
                      ),
                    ],
                  ),

                  GoRoute(
                    path: "/changePassword",
                    builder: (context, state) => ChangePasswordScreen(),
                    routes: [
                      GoRoute(
                        path: "/passwordChanged",
                        builder: (context, state) => PasswordChangedScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final List<String> unauthorizedRoutes = [
        "/login",
        "/register",
        "/passwordReset",
        "/passwordResetSent",
      ];
      final bool isLogined = sl.get<RoutesRefreshStream>().isLogined;
      final bool isUnauthorizedRoute = unauthorizedRoutes.contains(
        state.uri.path,
      );
      if (!isLogined && !isUnauthorizedRoute) {
        return "/login";
      } else if (isLogined && isUnauthorizedRoute) {
        return "/posts";
      } else {
        return null;
      }
    },
  );
}
