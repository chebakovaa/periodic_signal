import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:observable_ish/value/value.dart';

@lazySingleton
class SettingsService with ReactiveServiceMixin {
  SettingsService() {
    listenToReactiveValues([_countSecond]);
  }

  RxValue<int> _countSecond = RxValue<int>(initial: 600);

  int get countSecond => _countSecond.value;

  set countSecond(int count) {
    if (count != _countSecond.value) {
      _countSecond.value = count;
    }
  }

  Future<void> loadSettins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _countSecond.value = (prefs.getInt('countSecond') ?? 600);
  }

  Future<void> saveSettins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('countSecond', _countSecond.value);
  }
}
