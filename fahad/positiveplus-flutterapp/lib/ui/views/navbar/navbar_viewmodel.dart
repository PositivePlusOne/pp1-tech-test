import 'package:stacked/stacked.dart';

class NavbarViewModel extends BaseViewModel {
  int index = 0;

  void changeIndex(int val) {
    index = val;
    rebuildUi();
  }
}
