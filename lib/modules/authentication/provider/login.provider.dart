import 'package:flutter/material.dart';
import 'package:taskifie/modules/authentication/repository/auth.repo.dart';

class LoginProvider extends ChangeNotifier {
  final loginFormKey = GlobalKey<FormState>();
  bool isLoginButtonLoading = false;
  bool isPasswordVisible = false;
  bool isRememberMe = true;

  String email = '';
  String password = '';

  Future<bool> submitLoginForm() async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      return await loginWithEmailAndPassword(email: email, password: password);
    }
    return false;
  }

  toggleRememberMe() async {
    isRememberMe = !isRememberMe;
    await setUserAuthPersistence(isRememberMe);
    notifyListeners();
  }

  togglePasswordEyeIcon() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  toggleLoginButtonLoading() {
    isLoginButtonLoading = !isLoginButtonLoading;
    notifyListeners();
  }
}
