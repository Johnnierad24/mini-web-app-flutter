import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _snackbarService = locator<SnackbarService>();

  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    rebuildUi();
    
    _snackbarService.showSnackbar(
      message: 'Counter incremented to $_counter',
      duration: const Duration(seconds: 1),
    );
  }

  void resetCounter() {
    _counter = 0;
    rebuildUi();
    
    _snackbarService.showSnackbar(
      message: 'Counter reset to 0',
      duration: const Duration(seconds: 1),
    );
  }

  Future<void> showInfo() async {
    await _dialogService.showDialog(
      title: 'About This App',
      description: 
        'This is a Mini Web App Manager built with Flutter and Stacked architecture.\n\n'
        'Features:\n'
        '• MVVM Architecture Pattern\n'
        '• Dependency Injection\n'
        '• Auto-generated Routing\n'
        '• Reactive UI Updates\n'
        '• Service-based Architecture\n'
        '• Password Visibility Toggle\n\n'
        'Built with love using Flutter & Stacked! 💙',
      buttonTitle: 'Got it!',
    );
  }

  Future<void> logout() async {
    final response = await _dialogService.showConfirmationDialog(
      title: 'Logout',
      description: 'Are you sure you want to logout?',
      confirmationTitle: 'Logout',
      cancelTitle: 'Cancel',
    );

    if (response?.confirmed == true) {
      _snackbarService.showSnackbar(
        message: 'Logged out successfully',
        duration: const Duration(seconds: 2),
      );
      
      // Navigate back to login
      await _navigationService.replaceWithLoginView();
    }
  }
}
