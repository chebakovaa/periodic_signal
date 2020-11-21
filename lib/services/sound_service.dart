import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:soundpool/soundpool.dart';

@injectable
class SoundService {
  Soundpool _soundpool;

  //int _soundStreamId;

  int _soundId;
  // Future<int> _soundId;

  initPool() {
    _soundpool = Soundpool();
  }

  loadSound() async {
    var asset = await rootBundle.load("assets/music/chiller.mp3");
    _soundId = await _soundpool.load(asset);
  }

  Future<void> disposePool() async {
    _soundpool.dispose();
  }

  Future<void> playSound() async {
    // var _alarmSound = await _soundId;
    await _soundpool.play(_soundId);
  }
}
