import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:observable_ish/value/value.dart';

@lazySingleton
class SettingsService with ReactiveServiceMixin {
  Map<int, String> _actions = {0: 'Старт', 1: 'Стоп'};
  int _currentAction = 0;

  SettingsService() {
    listenToReactiveValues([_countSecond, _currentState, _soundVolume]);
  }

  RxValue<int> _countSecond = RxValue<int>(initial: 600);
  RxValue<String> _currentState = RxValue<String>(initial: 'Старт');
  RxValue<int> _soundVolume = RxValue<int>(initial: 50);

  int get countSecond => _countSecond.value;
  String get currentState => _currentState.value;
  int get soundVolume => _soundVolume.value;

  set soundVolume(int value) {
    if (value != _soundVolume.value) {
      _soundVolume.value = value;
    }
  }

  set countSecond(int count) {
    if (count != _countSecond.value) {
      _countSecond.value = count;
    }
  }

  void changeState() {
    _currentAction = 1 - _currentAction;
    _currentState.value = _actions[_currentAction];
  }

  Future<void> loadSettins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _countSecond.value = (prefs.getInt('countSecond') ?? 600);
    _soundVolume.value = (prefs.getInt('soundVolume') ?? 50);
  }

  Future<void> saveSettins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('countSecond', _countSecond.value);
    await prefs.setInt('soundVolume', _soundVolume.value);
  }
}
