import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskifie/app/route/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (FirebaseAuth.instance.currentUser != null) {
      resolver.next(true);
    } else {
      await resolver.redirect(
        LoginRoute(
          onLogin: (success) {
            resolver.next(success);
          },
        ),
      );
    }
  }
}
