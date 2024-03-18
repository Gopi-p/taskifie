// ignore_for_file: avoid_print
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskifie/app/route/app_router.dart';
import 'package:taskifie/shared/widgets/snackbar.dart';

Future<bool> loginWithEmailAndPassword({
  email = String,
  password = String,
}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return true;
  } on FirebaseException catch (e) {
    if (e.message?.contains('user-not-found') ?? false) {
      showSnackBar(
        msg: 'Account doesn\'t exists. Try Signup',
        type: ToastType.info,
      );
      print('No user found for that email.');
    } else if (e.message?.contains('wrong-password') ?? false) {
      showSnackBar(msg: 'Invalid credentials', type: ToastType.error);
    }
    return false;
  }
}

Future<void> setUserAuthPersistence(bool isRememberMe) async {
  await FirebaseAuth.instance.setPersistence(
    isRememberMe ? Persistence.INDEXED_DB : Persistence.SESSION,
  );
}

Future<bool> signupWithEmailAndPassword({
  email = String,
  password = String,
}) async {
  try {
    print(email + password);

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showSnackBar(
          msg: 'Account doesn\'t exists. Try Signup', type: ToastType.info);
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      showSnackBar(msg: 'Invalid credentials', type: ToastType.error);
    }
    return false;
  }
}

// Future<UserCredential?> loginWithMicrosoft365() async {
//   final microsoftProvider = MicrosoftAuthProvider();
//   try {
//     return await FirebaseAuth.instance.signInWithProvider(microsoftProvider);
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found') {
//       // showToast(
//       //     message: 'Account doesn\'t exists. Try Signup', type: ToastType.info);
//       print('No user found for that email.');
//     } else if (e.code == 'wrong-password') {
//       // showToast(
//       //     message: 'Invalid credentials or login method',
//       //     type: ToastType.error);
//     }
//     return null;
//   }
// }

// Future<UserCredential?> loginWithGoogle() async {
//   // Trigger the authentication flow
//   try {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;
//     if (googleAuth?.accessToken == null && googleAuth?.idToken == null) {
//       throw Exception('Modal closed by user');
//     }
//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );

//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   } catch (e) {
//     print('@@@ $e');
//     // }
//     return null;
//   }
// }

///
/// Logout user session
/// @param: [silent] whether to show the `Logged out` toast notification or not
/// @param: [navigateToLogin] whether to go to login page after log out or not. Context is required
/// if it is set to true.
///
Future<void> logoutUser({
  bool silent = false,
  bool navigateToLogin = false,
  BuildContext? ctx,
}) async {
  if (navigateToLogin) {
    assert(
        ctx != null, "Context is required if navigateToLogin is set to True");
  }

  try {
    await FirebaseAuth.instance.signOut();
    if (!silent) showSnackBar(msg: 'Logged out');
    if (navigateToLogin) {
      if (ctx != null) {
        // ignore: use_build_context_synchronously
        ctx.router.replaceAll([const AppLayoutRoute()]);
      }
    }
  } on FirebaseAuthException catch (e) {
    print(e);
    showSnackBar(msg: 'Error', type: ToastType.error);
  }
}
