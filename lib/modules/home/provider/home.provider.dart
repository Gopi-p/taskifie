import 'package:flutter/material.dart';
import 'package:taskifie/shared/interfaces/user.interface.dart';
import 'package:taskifie/shared/services/auth.service.dart';

class HomeProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey();

  UserDetails? userInfo = AuthService.o.userDetails;

  int selectSideMenuItemIndex = 0;

  updateActiveIndex(int index) {
    selectSideMenuItemIndex = index;
    notifyListeners();
  }
}
