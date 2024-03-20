import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taskifie/shared/configs/environments.dart';
import 'package:taskifie/shared/services/auth.service.dart';
import 'package:taskifie/shared/services/general.service.dart';
import 'package:url_strategy/url_strategy.dart';

class StartUpService {
  bool _isAppInitializedAfterAuth = false;

  /// This function is used to setup the application for first use.
  /// This should be called earliest as possible to maintain the proper app lifecycle.
  initAppBeforeAuth() async {
    setPathUrlStrategy();
    // await initializeFirebaseApp();
  }

  /// Some of the app logics must be called after user login otherwise app state will break.
  /// This function will be called after successful user login.
  Future<void> initAppAfterAuth() async {
    if (!_isAppInitializedAfterAuth) {
      // await GeneralService.o.configGraphQLClient();

      /// Make [_isAppInitializedAfterAuth] true to avoid multiple function executions while navigating between the screens.
      _isAppInitializedAfterAuth = true;
    }
  }

  Future<void> initializeFirebaseApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(options: Env.firebaseConfig);

    // /// Use local emulator for local development.
    // if (RUN_MODE == RunMode.dev) {
    //   try {
    //     await FirebaseAuth.instance.useAuthEmulator('localhost', 6001);
    //   } catch (e) {
    //     // ignore: avoid_print
    //     print(e);
    //   }
    // }

    AuthService.o.userStateChanges();
  }

  StartUpService._();
  static final StartUpService _o = StartUpService._();
  static StartUpService get o => _o;
}
