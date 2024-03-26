import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taskifie/app/splash_screen.dart';
import 'package:taskifie/app/custom.dart';
import 'package:taskifie/modules/authentication/guards/auth.guard.dart';
import 'package:taskifie/modules/authentication/guards/login_route.guard.dart';
import 'package:taskifie/modules/authentication/ui/login.ui.dart';
import 'package:taskifie/modules/authentication/ui/signup.ui.dart';
import 'package:taskifie/modules/app-layout/ui/app_layout.ui.dart';
import 'package:taskifie/modules/settings/settings.ui.dart';
import 'package:taskifie/modules/task-manager/create-edit-task/ui/create_task.ui.dart';
import 'package:taskifie/modules/task-manager/create-edit-task/ui/edit_task.ui.dart';
import 'package:taskifie/modules/task-manager/task-details/ui/task_details.ui.dart';
import 'package:taskifie/modules/task-manager/tasks-list/tasks_list.ui.dart';
import 'package:taskifie/modules/user-profile/ui/user_profile.ui.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashScreenRoute.page,
          path: '/',
          initial: true,
          children: [
            AutoRoute(
              page: CustomBuildRoute.page,
              path: 'custom',
            ),
            AutoRoute(
              page: LoginRoute.page,
              path: 'login',
              // guards: [LoginRouteGuard()],
            ),
            AutoRoute(
              page: SignUpRoute.page,
              path: 'signup',
              // guards: [LoginRouteGuard()],
            ),
            AutoRoute(
              page: AppLayoutRoute.page,
              path: 'home',
              initial: true,
              // initial: true,
              // guards: [AuthGuard()],
              children: [
                AutoRoute(
                  page: TasksListRoute.page,
                  path: 'tasks',
                  initial: true,
                ),
                AutoRoute(page: TaskDetailsRoute.page, path: ':taskId/:mode'),
                AutoRoute(page: UserProfileRoute.page, path: 'profile'),
                AutoRoute(page: SettingsRoute.page, path: 'settings'),
              ],
            ),
          ],
        ),
        RedirectRoute(path: '*', redirectTo: '/')
      ];
}
