import 'package:flutter/material.dart';
import 'package:taskifie/modules/authentication/repository/auth.repo.dart';

class SignupProvider extends ChangeNotifier {
  final signupFormKey = GlobalKey<FormState>();
  bool isSignupButtonLoading = false;
  bool isPasswordVisible = false;

  String email = '';
  String password = '';

  Future<bool> submitSignupForm() async {
    if (signupFormKey.currentState!.validate()) {
      signupFormKey.currentState!.save();
      return await signupWithEmailAndPassword(email: email, password: password);
    }
    return false;
  }

  togglePasswordEyeIcon() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  toggleSignupButtonLoading() {
    isSignupButtonLoading = !isSignupButtonLoading;
    notifyListeners();
  }
}
