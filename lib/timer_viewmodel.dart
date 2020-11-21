import 'package:simple_timer/services/settings_service.dart';
import 'package:simple_timer/services/sound_service.dart';
import 'package:simple_timer/services/time_service.dart';
import 'package:stacked/stacked.dart';

import 'app/locator.dart';

class StreamTimerViewModel extends StreamViewModel<int> {
  // int _interval = 60;
  String titleState;

  @override
  void initialise() {
    titleState = 'Старт';
    locator<SoundService>().initPool();
    locator<TimeService>().finishPeriod.forEach((element) {
      // debugPrint("Period finished");
      locator<SoundService>().playSound();
    });
    locator<SoundService>().loadSound();
    super.initialise();
  }

  String get interval =>
      (locator<SettingsService>().countSecond / 60).round().toString();

  String get balance => getBalance(locator<TimeService>().balance);

  String getBalance(int bln) {
    return '${((bln / 60).floor()).toString()}:${((((bln / 60 - (bln / 60).floor()) * 100).floor() * 60 / 100).floor()).toString().padLeft(2, '0')}';
  }

  @override
  Stream<int> get stream => locator<TimeService>()
      .timeUpdatesNumbers(locator<SettingsService>().countSecond);

  void changeState() {
    titleState = locator<TimeService>().isTicking ? 'Старт' : 'Стоп';
    locator<TimeService>().isTicking = !locator<TimeService>().isTicking;
    locator<TimeService>().interval = locator<SettingsService>().countSecond;
  }
}
