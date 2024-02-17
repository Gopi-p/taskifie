import 'package:auto_route/auto_route.dart';
import 'package:taskifie/modules/authentication/guards/login.guard.dart';
import 'package:taskifie/modules/authentication/guards/neg_login.guard.dart';
import 'package:taskifie/modules/authentication/ui/login.ui.dart';
import 'package:taskifie/modules/authentication/ui/signup.ui.dart';
import 'package:taskifie/modules/home/ui/home.ui.dart';
import 'package:taskifie/modules/task-manager/create-edit-task/ui/create_edit_task.ui.dart';
import 'package:taskifie/modules/task-manager/task-details/ui/task_details.ui.dart';
import 'package:taskifie/modules/user-profile/ui/user_profile.ui.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
          // guards: [LoginRouteGuard()],
          initial: true,
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: '/signup',
          // guards: [LoginRouteGuard()],
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          // guards: [AuthGuard()],
        ),
        AutoRoute(
          page: UserProfileRoute.page,
          path: '/profile',
          // guards: [AuthGuard()],
        ),
      ];
}
