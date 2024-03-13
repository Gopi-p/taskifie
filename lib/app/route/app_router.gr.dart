// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppLayoutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppLayoutPage(),
      );
    },
    CreateTaskRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateTaskPage(),
      );
    },
    EditTaskRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditTaskPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreenPage(),
      );
    },
    TaskDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TaskDetailsRouteArgs>(
          orElse: () => TaskDetailsRouteArgs(
                taskId: pathParams.getString('taskId'),
                mode: pathParams.getString('mode'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TaskDetailsPage(
          taskId: args.taskId,
          mode: args.mode,
          key: args.key,
        ),
      );
    },
    TasksListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TasksListPage(),
      );
    },
    UserProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserProfilePage(),
      );
    },
  };
}

/// generated route for
/// [AppLayoutPage]
class AppLayoutRoute extends PageRouteInfo<void> {
  const AppLayoutRoute({List<PageRouteInfo>? children})
      : super(
          AppLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppLayoutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateTaskPage]
class CreateTaskRoute extends PageRouteInfo<void> {
  const CreateTaskRoute({List<PageRouteInfo>? children})
      : super(
          CreateTaskRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTaskRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditTaskPage]
class EditTaskRoute extends PageRouteInfo<void> {
  const EditTaskRoute({List<PageRouteInfo>? children})
      : super(
          EditTaskRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditTaskRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreenPage]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute({List<PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TaskDetailsPage]
class TaskDetailsRoute extends PageRouteInfo<TaskDetailsRouteArgs> {
  TaskDetailsRoute({
    required String taskId,
    required String mode,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TaskDetailsRoute.name,
          args: TaskDetailsRouteArgs(
            taskId: taskId,
            mode: mode,
            key: key,
          ),
          rawPathParams: {
            'taskId': taskId,
            'mode': mode,
          },
          initialChildren: children,
        );

  static const String name = 'TaskDetailsRoute';

  static const PageInfo<TaskDetailsRouteArgs> page =
      PageInfo<TaskDetailsRouteArgs>(name);
}

class TaskDetailsRouteArgs {
  const TaskDetailsRouteArgs({
    required this.taskId,
    required this.mode,
    this.key,
  });

  final String taskId;

  final String mode;

  final Key? key;

  @override
  String toString() {
    return 'TaskDetailsRouteArgs{taskId: $taskId, mode: $mode, key: $key}';
  }
}

/// generated route for
/// [TasksListPage]
class TasksListRoute extends PageRouteInfo<void> {
  const TasksListRoute({List<PageRouteInfo>? children})
      : super(
          TasksListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TasksListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserProfilePage]
class UserProfileRoute extends PageRouteInfo<void> {
  const UserProfileRoute({List<PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
