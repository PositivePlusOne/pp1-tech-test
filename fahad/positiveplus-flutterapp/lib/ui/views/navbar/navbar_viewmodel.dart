import 'package:positiveplus/app/app.locator.dart';
import 'package:positiveplus/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NavbarViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int index = 0;

  void changeIndex(int val) {
    index = val;
    // rebuildUi();
    if (index == 0) {
      _navigationService.navigateToHomeView();
    } else if (index == 1) {
      _navigationService.navigateToSearchpageView();
    } else if (index == 3) {
      _navigationService.navigateToChatpageView();
    } else if (index == 4) {
      _navigationService.navigateToGuidanceView();
    }
  }
}
