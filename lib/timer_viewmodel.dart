import 'dart:async';

import 'package:simple_timer/services/settings_service.dart';
import 'package:simple_timer/services/sound_service.dart';
import 'package:simple_timer/services/time_service.dart';
import 'package:stacked/stacked.dart';

import 'app/locator.dart';

// const String _BalanceStreamKey = 'balance-stream';
// const String _ActionStreamKey = 'action-stream';

class StreamTimerViewModel extends StreamViewModel<String> {
  // int _interval = 60;

  // @override
  // Map<String, StreamData> get streamsMap => {
  //       _BalanceStreamKey:
  //           StreamData<String>(balanceStream()),
  //       _ActionStreamKey: StreamData<String>(actionStream()),
  //     };

  @override
  void initialise() {
    locator<SettingsService>().loadSettins();
    locator<SoundService>().initPool();
    locator<TimeService>().finishPeriod.forEach((element) {
      // debugPrint("Period finished");
      locator<SoundService>().playSound();
    });
    locator<SoundService>().loadSound(locator<SettingsService>().soundVolume);
    // locator<SoundService>()
    //     .updateVolume(locator<SettingsService>().soundVolume);
    super.initialise();
  }

  String get titleState => locator<SettingsService>().currentState;

  String get interval =>
      (locator<SettingsService>().countSecond / 60).round().toString();

  //String get actionTitle => _controllerAction.stream.;

  String getBalance(int bln) {
    return '${((bln / 60).floor()).toString()}:${((((bln / 60 - (bln / 60).floor()) * 100).floor() * 60 / 100).floor()).toString().padLeft(2, '0')}';
  }

  @override
  Stream<String> get stream =>
      locator<TimeService>().balance.map((event) => getBalance(event));

  //Stream<String> actionStream() => _controllerAction.stream;

  // Stream<int> get stream => locator<TimeService>()
  //     .timeUpdatesNumbers(locator<SettingsService>().countSecond);

  void changeTimerState() {
    locator<TimeService>().interval = locator<SettingsService>().countSecond;
    locator<TimeService>().isTicking = !locator<TimeService>().isTicking;
    locator<SettingsService>().changeState();
    locator<TimeService>().doUpdate();
    //titleState = locator<TimeService>().isTicking ? 'Стоп' : 'Старт';
  }

  @override
  void dispose() {
    locator<SettingsService>().saveSettins();
    super.dispose();
  }
}
