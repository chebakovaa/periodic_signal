import 'dart:async';

import 'package:injectable/injectable.dart';

@injectable
class TimeService {
  int _balance = 1;

  var _controller = new StreamController<bool>();

  int _interval;

  int get interval => _interval;

  set interval(int val) {
    _interval = val;
  }

  int get balance => _balance;

  bool _isTicking = false;

  bool get isTicking => _isTicking;

  set isTicking(bool st) {
    _isTicking = st;
    _balance = 1;
  }

  Stream<bool> get finishPeriod => _controller.stream;

  Stream<int> timeUpdatesNumbers(int interval) async* {
    _interval = interval;
    _balance = interval;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      if (isTicking) {
        _balance--;
      }
      if (_balance <= 0) {
        _balance = _interval;
        _controller.add(true);
      }
      yield _balance;
    }
  }
}
