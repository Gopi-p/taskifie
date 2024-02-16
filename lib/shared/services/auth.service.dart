import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskifie/modules/authentication/repository/auth.repo.dart';

class AuthService {
  Map<String, dynamic>? userAuthClaims;

  void userStateChanges() {
    FirebaseAuth.instance.userChanges().listen((User? user) async {
      if (user != null) {
        try {
          userAuthClaims = (await user.getIdTokenResult()).claims;

          // await AuthService.o.fetchUserAndOrgDetails(
          //   orgId: userAuthClaims!['orgId'],
          //   userId: userAuthClaims!['userId'],
          // );
        } catch (e) {
          await logoutUser(silent: true);
        }
      }
    });
  }

  // Future fetchUserAndOrgDetails({
  //   required String userId,
  //   required String orgId,
  // }) async {
  //   var usersDetails = await getUserDetailsQuery(userIds: [userId]);

  //   if (usersDetails.isNotEmpty) {
  //     userDetailsV = usersDetails[0];
  //   }
  //   orgDetailsV = await getOrganizationDetailsQuery(orgId: orgId);
  // }

  AuthService._();
  static final AuthService _o = AuthService._();
  static AuthService get o => _o;
}
