import 'dart:async';

import 'package:injectable/injectable.dart';

@injectable
class TimeService {
  int _balance = 1;

  var _controllerSignal = new StreamController<bool>();
  var _controllerTick = new StreamController<int>();
  Timer _timerSignal;
  Timer _timerTick;

  int _interval;

  int get interval => _interval;

  set interval(int val) {
    _interval = val;
  }

  // int get balance => _balance;

  bool _isTicking = false;

  bool get isTicking => _isTicking;

  set isTicking(bool st) {
    _isTicking = st;
    _balance = interval;
    if (st) {
      timeUpdatesNumbers(_interval);
    } else {
      _timerSignal.cancel();
      _timerSignal = null;
      _timerTick.cancel();
      _timerTick = null;
    }
  }

  Stream<bool> get finishPeriod => _controllerSignal.stream;

  Stream<int> get balance => _controllerTick.stream;

  void timeUpdatesNumbers(int interval) {
    _timerSignal = Timer.periodic(
        const Duration(seconds: 1) * interval, (timer) => doSignal(interval));
    _timerTick = Timer.periodic(
        const Duration(seconds: 1), (timer) => _controllerTick.add(_balance--));

    // while (true) {
    //   await Future.delayed(const Duration(seconds: 1));
    //   if (isTicking) {
    //     _balance--;
    //   }
    //   if (_balance <= 0) {
    //     _balance = _interval;
    //     _controller.add(true);
    //   }
    //   yield _balance;
    // }
  }

  doUpdate() {
    _controllerTick.add(interval);
  }

  doSignal(int interval) {
    _balance = interval;
    _controllerSignal.add(true);
  }
}
