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

  loadSound(newVolume) async {
    var asset = await rootBundle.load("assets/music/chiller.mp3");
    _soundId = await _soundpool.load(asset);
    _soundpool.setVolume(soundId: _soundId, volume: newVolume.toDouble() / 100);
    await _soundpool.play(_soundId);
  }

  Future<void> disposePool() async {
    _soundpool.dispose();
  }

  Future<void> playSound() async {
    // var _alarmSound = await _soundId;
    await _soundpool.play(_soundId);
  }

  Future<void> updateVolume(int newVolume) async {
    var _cheeringSound = _soundId;
    _soundpool.setVolume(
        soundId: _cheeringSound, volume: newVolume.toDouble() / 100);
    await _soundpool.play(_soundId);
  }
}
