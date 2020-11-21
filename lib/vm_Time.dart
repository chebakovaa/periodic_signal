//import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';

class TimeViewModel extends BaseViewModel {
  String titleInterval = "600";
  int interval = 600;

  int balance = 0;
  String balanceTime = '0';

  void initialise() {
    // titleInterval = "600";
    balance = interval;
    notifyListeners();
  }

  void updateTitle() {
    titleInterval = '60'; // ${interval / 60}';
    notifyListeners();
  }

  void updateBalance() {
    balanceTime = '0';
    //'${((balance / 60).floor()).toString()}:${((((balance / 60 - (balance / 60).floor()) * 100).floor() * 60 / 100).floor()).toString().padLeft(2, '0')}';
    notifyListeners();
  }
}
