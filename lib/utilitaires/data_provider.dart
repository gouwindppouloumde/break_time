import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  bool isLoginformVisible = false;
  bool isSignupformVisible = false;

  showSignupForm() {
    isSignupformVisible = true;
    notifyListeners();
  }

  hideSignupForm() {
    isSignupformVisible = false;
    notifyListeners();
  }

  showLoginForm() {
    isSignupformVisible = true;
    notifyListeners();
  }

  hideLoginForm() {
    isSignupformVisible = false;
    notifyListeners();
  }

  bool get signupFormstate => isSignupformVisible;
  bool get loginFormstate => isLoginformVisible;
}
