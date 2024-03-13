import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taskifie/app/route/app_router.dart';
import 'package:taskifie/shared/interfaces/user.interface.dart';
import 'package:taskifie/shared/services/auth.service.dart';

class AppLayoutProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey();

  UserDetails? userInfo = AuthService.o.userDetails;

  late int selectSideMenuItemIndex;

  updateActiveIndex(int index) {
    selectSideMenuItemIndex = index;
    notifyListeners();
  }
}

List<MenuItemIF> menuItems = <MenuItemIF>[
  // MenuItemIF(title: 'Dashboard', icon: Icons.dashboard, route: ''),
  MenuItemIF(
      title: 'Tasks', icon: Icons.task_alt, route: const TasksListRoute()),
  MenuItemIF(
      title: 'Profile', icon: Icons.person, route: const UserProfileRoute()),
  MenuItemIF(
      title: 'Settings', icon: Icons.settings, route: const SettingsRoute()),
];

class MenuItemIF {
  final String title;
  final IconData icon;
  final PageRouteInfo route;

  MenuItemIF({required this.title, required this.icon, required this.route});
}
