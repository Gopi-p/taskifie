import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskifie/modules/authentication/repository/auth.repo.dart';
import 'package:taskifie/shared/interfaces/user.interface.dart';
import 'package:taskifie/shared/repository/user.repo.dart';
import 'package:taskifie/shared/services/startup.service.dart';

class AuthService {
  Map<String, dynamic>? userAuthClaims;
  UserDetails? userDetails;

  void userStateChanges() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        try {
          await StartUpService.o.initAppAfterAuth();
          print(user.uid);
          // await AuthService.o.fetchUserDetails(userId: user.uid);
        } catch (e) {
          await logoutUser(silent: true);
        }
      }
    });
  }

  Future fetchUserDetails({required String userId}) async {
    userDetails = (await getUserDetailsQuery(userIds: [userId]))[0];
  }

  AuthService._();
  static final AuthService _o = AuthService._();
  static AuthService get o => _o;
}
