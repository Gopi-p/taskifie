import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskifie/app/route/app_router.dart';

class LoginRouteGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    if (FirebaseAuth.instance.currentUser != null) {
      resolver.next(false);
      router.push(const HomeRoute());
    } else {
      resolver.next(true);
    }
  }
}
