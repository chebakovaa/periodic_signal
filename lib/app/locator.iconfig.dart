// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:simple_timer/services/settings_service.dart';
import 'package:simple_timer/services/sound_service.dart';
import 'package:simple_timer/services/time_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<TimeService>(() => TimeService());
  g.registerLazySingleton<SettingsService>(() => SettingsService());
  g.registerLazySingleton<SoundService>(() => SoundService());
}
