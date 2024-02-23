import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskifie/modules/authentication/repository/auth.repo.dart';
import 'package:taskifie/shared/interfaces/user.interface.dart';
import 'package:taskifie/shared/repository/user.repo.dart';

class AuthService {
  Map<String, dynamic>? userAuthClaims;
  UserDetails? userDetails;

  void userStateChanges() {
    FirebaseAuth.instance.userChanges().listen((User? user) async {
      if (user != null) {
        try {
          userAuthClaims = (await user.getIdTokenResult()).claims;

          await AuthService.o.fetchUserAndOrgDetails(
            userId: userAuthClaims!['userId'], //TODO
          );
        } catch (e) {
          await logoutUser(silent: true);
        }
      }
    });
  }

  Future fetchUserAndOrgDetails({required String userId}) async {
    userDetails = (await getUserDetailsQuery(userIds: [userId]))[0];
  }

  AuthService._();
  static final AuthService _o = AuthService._();
  static AuthService get o => _o;
}
