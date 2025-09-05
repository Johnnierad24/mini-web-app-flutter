import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  StartupViewModel() {
    _initialize();
  }

  Future<void> _initialize() async {
    // Simulate some startup process
    await Future.delayed(const Duration(seconds: 2));
    
    // Navigate to login view
    await _navigationService.replaceWithLoginView();
  }
}
