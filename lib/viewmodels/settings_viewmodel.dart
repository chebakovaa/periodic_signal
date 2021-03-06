import 'package:flutter/material.dart';
import 'package:simple_timer/app/locator.dart';
import 'package:simple_timer/services/settings_service.dart';
import 'package:simple_timer/services/sound_service.dart';
import 'package:simple_timer/services/time_service.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends ReactiveViewModel {
  // int _interval = 60;
  TextEditingController _timeController;

  SettingsViewModel() : super() {
    var _service = locator<SettingsService>();
    _service.loadSettins();
    _timeController = new TextEditingController(
        text: (_service.countSecond / 60).round().toString());
    _timeController.addListener(() {
      _service.countSecond = int.parse(_timeController.value.text) * 60;
      locator<TimeService>().doUpdate();
      locator<SettingsService>().saveSettins();
    });
    _service.addListener(() {
      _timeController.text = (_service.countSecond / 60).round().toString();
    });
  }

  TextEditingController get controller => _timeController;

  @override
  dispose() {
    // locator<SettingsService>().saveSettins();
    _timeController.dispose();
    super.dispose();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices =>
      [locator<SettingsService>()];

  void upValue() {
    locator<SettingsService>().countSecond =
        locator<SettingsService>().countSecond + 60;
  }

  void downValue() {
    locator<SettingsService>().countSecond =
        locator<SettingsService>().countSecond - 60;
  }

  int get soundVolume => locator<SettingsService>().soundVolume;

  set soundVolume(int newVolume) {
    locator<SettingsService>().soundVolume = newVolume;
    locator<SoundService>().updateVolume(newVolume);
    locator<SettingsService>().saveSettins();
  }

  Future<void> changeSound() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ['mp3'],
    // );
    // if (result != null) {
    //   File file = File(result.files.single.path);
    // } else {
    //   // User canceled the picker
    // }
  }
}
