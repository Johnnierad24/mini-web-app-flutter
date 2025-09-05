import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _snackbarService = locator<SnackbarService>();

  // Controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Password visibility state
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  // Remember me state
  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    rebuildUi();
  }

  void toggleRememberMe(bool? value) {
    _rememberMe = value ?? false;
    rebuildUi();
  }

  Future<void> login() async {
    setBusy(true);

    try {
      // Validate inputs
      if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
        _snackbarService.showSnackbar(
          message: 'Please enter both username and password',
          duration: const Duration(seconds: 3),
        );
        return;
      }

      // Simulate authentication delay
      await Future.delayed(const Duration(seconds: 1));

      // Simple demo authentication
      if (usernameController.text.trim().toLowerCase() == 'demo' &&
          passwordController.text == 'password123') {
        
        _snackbarService.showSnackbar(
          message: 'Login successful! Welcome ${usernameController.text}',
          duration: const Duration(seconds: 2),
        );

        // Navigate to home view
        await _navigationService.replaceWithHomeView();
      } else {
        _snackbarService.showSnackbar(
          message: 'Invalid credentials. Please try again.',
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      _snackbarService.showSnackbar(
        message: 'An error occurred during login. Please try again.',
        duration: const Duration(seconds: 3),
      );
    } finally {
      setBusy(false);
    }
  }

  Future<void> showForgotPassword() async {
    await _dialogService.showDialog(
      title: 'Forgot Password',
      description: 
        'For this demo app, you can use the following credentials:\n\n'
        'Username: demo\n'
        'Password: password123\n\n'
        'In a real app, this would send a password reset email.',
      buttonTitle: 'Got it!',
    );
  }
}
