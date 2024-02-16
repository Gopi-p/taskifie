import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskifie/app/route/app_router.dart';
import 'package:taskifie/shared/services/startup.service.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (FirebaseAuth.instance.currentUser != null) {
      await StartUpService.o.initAppAfterAuth();
      resolver.next(true);
    } else {
      await router.push(const LoginRoute());
      resolver.next(false);
    }
  }
}
